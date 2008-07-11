# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'bc8bb3f23d6d3c8a39a3a2ddc438d8fe'
  
  def authenticate
    authenticate_or_request_with_http_basic do |name, pass|
      #User.authenticate(name, pass)
      name == 'calc' && pass == 'calc'      
    end
  end

  protected 
  def load_project
    @project = Project.find(params[:project_id]) if params.include? :project_id
  end
  
  def load_project_page
    @project = Project.find(params[:project_id])
    @page = Page.find(params[:page_id])
  end

end
