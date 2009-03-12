
class Soda::SodaController < ApplicationController
  layout 'soda/soda'
  
  def index
    render :action => 'sodauc', :layout => false
  end
  
  def pagina
    @page = Page.find(params[:id])
  end
end