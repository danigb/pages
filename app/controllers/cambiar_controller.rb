class CambiarController < ApplicationController
  include SolidaridadSite
  before_filter :load_project
  layout 'admin'
  
  def index
    redirect_to :action => 'seccion', :id => 'agenda'
  end
  
  def seccion
    @section = params[:id]
    @pages = page_of(@section).children
  end
end
