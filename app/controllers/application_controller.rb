# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
#  before_filter :force_plugin_reload
  
  protected
  def add_breadcrumb name, url = ''
    @breadcrumbs ||= []
    url = eval(url) if url =~ /_path|_url|@/
    @breadcrumbs << [name, url]
  end

  def self.add_breadcrumb name, url, options = {}
    before_filter options do |controller|
      controller.send(:add_breadcrumb, name, url)
    end
  end

  def force_plugin_reload
    ActiveSupport::Dependencies.load_file "r_settings.rb" if "development" == RAILS_ENV
  end

  add_breadcrumb "home", "root_path"
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
