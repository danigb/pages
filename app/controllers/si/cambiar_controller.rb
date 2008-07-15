

class Si::CambiarController < ApplicationController
  include Si::SolidaridadSite
  layout 'si_cambiar'
  before_filter :authenticate
  
  def index
    redirect_to :action => 'seccion', :id => 'agenda'
  end
  
  def seccion
    @section = params[:id]
    @pages = page_of(@section).children
  end
  
  def crear
    @section = params[:id]
    parent = page_of @section
    @page = parent.children.build
  end
  
  def editar
    @page = Page.find(params[:id])
    @section = @page.parent.title.downcase
  end
  
  def create_agenda
    params[:page][:content] = params[:date] + "\n" + params[:content]
    @page = Page.new(params[:page])
    if @page.save
      redirect_to :action => 'seccion', :id => 'agenda'
    end
  end
  
  def update_agenda
    @page = Page.find(params[:id])
    @page.update_attributes(params[:page])
  end
  
  def create_actualidad
    @page = Page.new(params[:page])
    if @page.save
      flash[:notice] = 'Se ha añadido una entrada a la actualidad.'
      redirect_to :action => 'seccion', :id => 'actualidad'
    end
  end
  
  def create_actualidad_old
    @page = Page.new(params[:page])
    if @page.save
      @attachment = Attachment.new(params[:attachment])
      if @attachment.save
        flash[:notice] = 'Se ha añadido una entrada a la actualidad.'
        redirect_to :action => 'seccion', :id => 'actualidad'
      else
        render_crear @page.parent.title
      end
    else
      render_crear @page.parent.title
    end
  end
  
  
  private
  def render_crear(section)
    render :action => "crear_#{section.downcase}"
  end
end
  
