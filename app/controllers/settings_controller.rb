class SettingsController < ApplicationController
  add_breadcrumb 'global settings', 'settings_path'
  add_breadcrumb 'add new setting','',  :only => [:new, :create]

  def index
    @settings = RSettings.all
  end

  def show
    #This will produce a SQL query
    @setting = RSettings.find_by_key(params[:id])
    add_breadcrumb "“#{@setting.key}”"
    #And this will not produce a query, value will be loaded from a cache 
    @cached_value = RSettings[params[:id]]
  end

  def new
    @setting = RSettings.new
  end

  def create
    @setting = RSettings.new(params[:r_settings])
    if @setting.save
      flash[:message] = "New global setting was successfully created."
      redirect_to setting_path(@setting)
    else
      render :action => :new
    end
  end

  def edit
    #This will produce a SQL query, but this is really necessary for editing
    @setting = RSettings.find_by_key(params[:id])
    add_breadcrumb "“#{@setting.key}”", setting_path(@setting)
    add_breadcrumb "edit"
  end

  def update
    @setting = RSettings.find_by_key(params[:id])
    add_breadcrumb "“#{@setting.key}”", setting_path(@setting)
    add_breadcrumb "edit"
    if @setting.update_attributes(params[:r_settings])
      flash[:message] = "Global setting '#{@setting.key}' was successfully updated."
      redirect_to setting_path(@setting)
    else
      render :action => :edit
    end
  end

  def destroy
    if RSettings.destroy(params[:id])
      flash[:message] = "Global setting '#{params[:id]}' was successfully destroyed."
      redirect_to settings_path
    end
  end

end
