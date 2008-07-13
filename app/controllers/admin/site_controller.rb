# 
# To change this template, choose Tools | Templates
# and open the template in the editor.
 

class Admin::SiteController < ApplicationController
  before_filter :load_project
  layout 'admin'
  
  def index
    redirect_to :action => 'create' if @project.nil?
    @users = User.find(:all)
  end
  
  def create
    page = Page.new(:title => 'site')
    page.save
    redirect_to :action => 'index'
  end
  
end
