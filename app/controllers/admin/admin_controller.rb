
class Admin::AdminController < ApplicationController

  PAGES_VERSION = "0.4.020"

  before_filter :authenticate_admin
  cache_sweeper :page_sweeper

end
