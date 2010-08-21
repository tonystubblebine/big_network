class RelationshipsController < ApplicationController
  unloadable
  before_filter :require_user
  before_filter :require_super_user, :only => [:merge, :confirm_merge]
  before_filter :capture_user

  # GET /relationships
  # GET /relationships.xml
  def index
    @relationships = Relationship.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @relationships }
    end
  end

  # GET /relationships/1
  # GET /relationships/1.xml
  def show
    @relationship = Relationship.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @relationship }
    end
  end

  # GET /relationships/new
  # GET /relationships/new.xml
  def new
    @relationship = Relationship.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @relationship }
    end
  end

  # GET /relationships/1/edit
  def edit
    @relationship = Relationship.find(params[:id])
  end

  # POST /relationships
  # POST /relationships.xml
  def create
    @with_user = User.find(params[:with_user] || params[:relationship][:with_user])
    @relationship = Relationship.new(:user => @user,
                                     :with_user => @with_user)

    respond_to do |format|
      if current_user == @user and @relationship.save
        format.html { redirect_to(@relationship, :notice => 'Relationship was successfully created.') }
        format.xml  { render :xml => @relationship, :status => :created, :location => @relationship }
        format.js
      else
        @relationship.errors.add_to_base("You do not have permission.") if current_user != @user
        format.html { render :action => "new" }
        format.xml  { render :xml => @relationship.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /relationships/1
  # PUT /relationships/1.xml
  def update
    @relationship = Relationship.find(params[:id])

    respond_to do |format|
      if @relationship.update_attributes(params[:relationship])
        format.html { redirect_to(@relationship, :notice => 'Relationship was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @relationship.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /relationships/1
  # DELETE /relationships/1.xml
  def destroy
    @relationship = Relationship.find(params[:id])
    @relationship.destroy

    respond_to do |format|
      format.html { redirect_to(user_relationships_url(@user)) }
      format.xml  { head :ok }
    end
  end

  private
  def capture_user
    @user = User.find(params[:user_id])
  end
end
