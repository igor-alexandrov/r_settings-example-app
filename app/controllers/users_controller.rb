class UsersController < ApplicationController
  add_breadcrumb 'users', 'users_path'

  def index
    #This will produce a SQL query and also load all settings for all users.
    @users = User.all(:include => [:r_settings])
  end
end
