
class Admin::AdminController < ApplicationController  
  before_filter :authenticate_admin
  cache_sweeper :page_sweeper

end
