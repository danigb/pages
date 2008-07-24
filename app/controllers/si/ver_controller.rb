class Si::VerController < ApplicationController
  include Si::SolidaridadSite
  layout 'si_ver'
  before_filter  :load_roots
	
  
  def index
    redirect_to :action => :pagina, :id => @content
  end
        
  def pagina
    @page = Page.find(params[:id])
  end
    
  def foro
    @name = 'foro'
    @page = page_of :foro
    @items = Page.find(:all, :conditions => ['parent_id = ?', @page.id], :order => 'position DESC')
  end
  
  # muestra un asunto del foro
  def asunto
    @name = 'foro'
    @page = Page.find(params[:id])
  end
  
  def nuevo_tema
    @name = 'foro'
  end

  def ver_tema
    @name = 'foro'
    @tema = Page.find(params[:id])
  end
  
  def responder
    @tema = Page.find(params[:id])
    add_response(@tema, params[:name], params[:text]).save
    render :action => 'ver_tema'
  end
  
  # Crea un nuevo asunto en el foro
  def crear_tema
    foro = page_of :foro
    @tema = foro.children.build(:title => params[:title], :state => 'published', :mime => 'tema')
    add_response(@tema, params[:name], params[:text])
    if @tema.save
      render :action => 'ver_tema'
    else
      @error = "Lo siento, no se ha podido crear el tema. Vuelve a intentarlo dentro de unos minutos"
      render :action => 'error'
    end
  end
  
  def la
    seccion
  end
  
  def los
    seccion
  end
  
  private
  def add_response(tema, name, body)
    tema.children.build(:title => name, :state => 'published', :mime => 'respuesta', :content => body)
  end
  
  def seccion
    @name = params[:id]
    page = page_of @name
    @items = Page.find(:all, :conditions => "parent_id = #{page.id}", :order => 'position DESC')
    render :action => 'seccion'
  end
	
  def load_roots
    @content = page_of :dossier
  end
end
