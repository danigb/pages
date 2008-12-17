
class Soda::SodaController < ApplicationController
  layout 'soda/soda'
  
  def index
    redirect_to :action => 'pagina', :id => 1
  end
  
  def pagina
    @page = Page.find(params[:id])
  end
end