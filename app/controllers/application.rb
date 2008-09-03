# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  before_filter :load_site
  
  # See ActionController::RequestForgeryProtection for details Uncomment the
  # :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'bc8bb3f23d6d3c8a39a3a2ddc438d8fe'

  def authenticate_admin
    authenticate_or_request_with_http_basic('Pages::Admin') do |name, pass|
      # #User.authenticate(name, pass)
      user_valid(name, pass) || admin_valid(name, pass)
    end
  end

  def load_site
    @site = Page.find(1)
  end

  def user_valid(name, pass)
    session[:admin] = false
    name == APP_CONFIG['user']['name'] && pass == APP_CONFIG['user']['pass']
  end
  
  def admin_valid(name, pass)
    admin = APP_CONFIG['admin']

    if !admin.nil? && name == admin['name'] && pass == admin['pass']
      session[:admin] = true
      true
    elsif
      false
    end
  end
  

  end
