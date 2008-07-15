class Si::CambiarController < ApplicationController
  include Si::SolidaridadSite
  layout 'si_cambiar'
  before_filter :authenticate
  
  def index
    redirect_to :action => 'dossier'
  end
  
  def dossier
    @section = 'dossier'
    @page = page_of(@section)
  end
  
  def create_sub
    if params[:title] != ''
      @page = Page.new(:parent_id => params[:id], :mime => 'sub', :state => 'locked', :title => params[:title])
      @page.save
    end
    redirect_to :action => 'dossier'
  end
  
  def hija
    @page = Page.new(:parent_id => params[:id], :mime => 'página', :state => 'published')
    render :action => 'editar_pagina'
  end
  
  def editar_pagina
    @page = Page.find(params[:id])
    @attachment= Attachment.new(:parent_id => @page)
  end
  
  def save
    @page = params[:page_id] == '' ? Page.new : Page.find(params[:page_id])
    @page.attributes = params[:page]
    if @page.save
      flash[:notice] = 'Página guardada'
      @attachment= Attachment.new(:parent_id => @page)
    end
    render :action => 'editar_pagina'
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
    save_item(@page, section, 'Se ha añadido una entrada a')
  end
  
  
  def update
    section = params[:section]
    prepare_content
    @page = Page.find(params[:id])
    @page.attachments.build(params[:attachment]) if has_attachment
    @page.attributes = params[:page]
    save_item(@page, section, 'Se ha actualizada la entrada en')
  end
  
  private
  def save_item(page, section, message)
    if page.save
      flash[:notice] = "#{message} '#{section}'."
      redirect_to :action => 'seccion', :id => section
    else
      render :action => "crear_#{section.downcase}"
    end
  end
  
  def has_attachment
    !params[:attachment].nil? && params[:attachment][:uploaded_data] != ''
  end
  
  def prepare_content
    params[:page][:content] = params[:date] + "\n" + params[:content] if params[:section] == 'agenda'    
  end
end
  
