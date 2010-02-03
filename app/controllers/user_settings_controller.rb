class UserSettingsController < ApplicationController
  add_breadcrumb 'users', 'users_path'

  def show
    @user = User.find_by_login(params[:user_id])
    @setting = RSettings.find_by_key(params[:id], :conditions => {:object_id => @user.id, :object_type => @user.class.base_class.to_s})
    add_breadcrumb "“#{@user.login}”", user_path(@user)
    add_breadcrumb "“#{@setting.key}”"
    @cached_value = @user.settings[params[:id]]
  end

  def new
    @user = User.find_by_login(params[:user_id])
    @setting = RSettings.new
    add_breadcrumb "“#{@user.login}”", user_path(@user)
    add_breadcrumb 'add new setting'
  end

  def create
    @user = User.find_by_login(params[:user_id])
    @setting = RSettings.new(params[:r_settings].merge(:object_id => @user.id, :object_type => @user.class.base_class.to_s))
    if @setting.save
      flash[:message] = "New setting for User '#{@user.login}' was successfully created."
      redirect_to users_path
    else
      add_breadcrumb "“#{@user.login}”", user_path(@user)
      add_breadcrumb 'add new setting'
      render :action => :new
    end
  end

  def edit
    @user = User.find_by_login(params[:user_id])
    @setting = RSettings.find_by_key_and_object_type_and_object_id(params[:id], @user.class.base_class.to_s, @user.id)
    add_breadcrumb "“#{@user.login}”", user_path(@user)
    add_breadcrumb "“#{@setting.key}”", user_setting_path(@user, @setting)
    add_breadcrumb "edit"
  end

  def update
    @user = User.find_by_login(params[:user_id])
    @setting = RSettings.find_by_key_and_object_type_and_object_id(params[:id], @user.class.base_class.to_s, @user.id)
    if @setting.update_attributes(params[:r_settings])
      flash[:message] = "Setting '#{@setting.key}' for User '#{@user.login}' was successfully updated."
      redirect_to user_setting_path(@user, @setting)
    else
      add_breadcrumb "“#{@user.login}”", user_path(@user)
      add_breadcrumb "“#{@setting.key}”", user_setting_path(@user, @setting)
      add_breadcrumb "edit"
      render :action => :edit
    end
  end

  def destroy
    @user = User.find_by_login(params[:user_id])
    if @user.settings.destroy(params[:id])
      flash[:message] = "Setting '#{params[:id]}' for User '#{@user.login}' was successfully destroyed."
      redirect_to users_path
    end
  end
end
