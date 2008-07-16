
class Admin::AdminController < ApplicationController
  before_filter :authenticate_admin
  
  def authenticate_admin
    authenticate_or_request_with_http_basic('Pages::Admin') do |name, pass|
      # #User.authenticate(name, pass)
      name == 'calcaxy' && pass == 'calcaxy'      
    end
  end



end
