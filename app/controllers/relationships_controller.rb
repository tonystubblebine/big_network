class RelationshipsController < ApplicationController
  unloadable
  before_filter :require_user
  before_filter :capture_user, :only => [:index, :show]
  before_filter :capture_user_with_permission, :except => [:index, :show]

  # GET /relationships
  # GET /relationships.xml
  def index
    @relationships = @user.relationships

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @relationships }
    end
  end

  # GET /relationships/1
  # GET /relationships/1.xml
  def show
    @relationship = @user.relationships.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @relationship }
    end
  end

  # GET /relationships/new
  # GET /relationships/new.xml
  def new
    @relationship = @user.relationships.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @relationship }
    end
  end

  # GET /relationships/1/edit
  def edit
    @relationship = @user.relationships.find(params[:id])
  end

  # POST /relationships
  # POST /relationships.xml
  def create
    @with_user = User.find(params[:with_user_id] || params[:relationship][:with_user_id])
    @relationship = @user.relationships.new(:user => @user,
                                     :with_user => @with_user)

    respond_to do |format|
      if current_user == @user and @relationship.save
        format.html { redirect_to("/", :notice => 'Relationship was successfully created.') }
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
    @relationship = @user.relationships.find(params[:id])

    respond_to do |format|
      if @relationship.update_attributes(params[:relationship])
        format.html { redirect_to("/", :notice => 'Relationship was successfully updated.') }
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
    @relationship = @user.relationships.find(params[:id])
    @relationship.destroy

    respond_to do |format|
      format.html { redirect_to("/") }
      format.xml  { head :ok }
    end
  end

  private
  def capture_user
    @user = User.find(params[:user_id])
  end
  
  def capture_user_with_permission
    @user = User.find(params[:user_id])
    unless (current_user and current_user == @user) or (current_user and current_user.super_user?)
      render_error(404)
    end
  end
end
