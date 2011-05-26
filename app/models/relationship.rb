class Relationship < ActiveRecord::Base
  unloadable
  belongs_to :with_user, :class_name => "User", :foreign_key => "with_user_id"
  belongs_to :user 

  validates_presence_of :with_user, :user

  def self.suggested(user)
    # for now this just finds and list of users, but eventually we'll want to do something intelligent
    User.find(:all,
              :conditions => [ "users.id not in (?)", 
                               user.friends.empty? ? user.id : (user.friends.map{|a| a.id} << user.id) ]
              ).sort{|a,b| a.name <=> b.name }
  end

end
