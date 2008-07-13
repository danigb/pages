class Si::CambiarController < ApplicationController
  include Si::SolidaridadSite
  layout 'admin'
  
  def index
    redirect_to :action => 'seccion', :id => 'agenda'
  end
  
  def seccion
    @section = params[:id]
    @pages = page_of(@section).children
  end
  
  def crear
    @section = params[:id]
    @parent = page_of @section
    @page = @parent.children.build
    render :action => "crear_#{@section}"
  end
  
  def create_agenda
    @page = Page.new(:title => params[:title], :parent_id => params[:parent_id])
    if @page.save
      @page.contents.build(:data => params[:date] + "\n" + params[:content])
      @page.save
      redirect_to :action => 'seccion', :id => 'agenda'
    end
  end
end
