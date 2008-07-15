

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
    section = params[:id]
    parent = page_of section
    @page = parent.children.build
    render_crear section
  end
  
  def create_agenda
    @page = Page.new(:title => params[:title], :parent_id => params[:parent_id],
      :content => params[:date] + "\n" + params[:content], :mime => 'agenda')
    if @page.save
      redirect_to :action => 'seccion', :id => 'agenda'
    end
  end
  
  def create_actualidad
    @attachment = Attachment.new(params[:attachment])
    @page = Page.new(params[:page])
    Page.transaction do
      @page.save!
      @attachment.save!
    end
    flash[:notice] = 'Se ha añadido una entrada a la actualidad.'
    redirect_to :action => 'seccion', :id => 'actualidad'
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
  
