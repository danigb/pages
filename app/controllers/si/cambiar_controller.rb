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
  
  def nuevo
    @section = params[:id]
    parent = page_of @section
    @page = parent.children.build
  end
  
  def editar
    @page = Page.find(params[:id])
    @section = @page.parent.title.downcase
  end
  
  def create
    section = params[:section]
    prepare_content
    @page = Page.new(params[:page])
    @page.attachments.build(params[:attachment]) if has_attachment
    if @page.save
      flash[:notice] = "Se ha añadido una entrada a '#{section}'."
      redirect_to :action => 'seccion', :id => section
    else
      render_crear section
    end
  end
  
  def update
    section = params[:section]
    prepare_content
    @page = Page.find(params[:id])
    @page.attachments.build(params[:attachment]) if has_attachment
    @page.attributes = params[:page]
    if @page.save
      flash[:notice] = "Se ha actualizado la entrada en '#{section}'."
      redirect_to :action => 'seccion', :id => section
    else
      render_crear section
    end
  end
  
  private
  def render_crear(section)
    render :action => "crear_#{section.downcase}"
  end
  
  def has_attachment
    !params[:attachment].nil? && params[:attachment][:uploaded_data] != ''
  end
  
  def prepare_content
    params[:page][:content] = params[:date] + "\n" + params[:content] if params[:section] == 'agenda'    
  end
end
  
