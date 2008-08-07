class Si::VerController < ApplicationController
  include Si::SolidaridadSite
  layout 'si_ver'
  before_filter  :load_roots, :load_news

  
  def index
  end
        
  def pagina
    @page = Page.find(params[:id])
  end
    
  def foro
    @name = 'foro'
    @page = page_of :foro
    @items = Page.find(:all, :conditions => ['parent_id = ? AND state = ?', @page.id, 'published'], :order => 'position DESC')
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
    @respuestas = Page.find(:all, :conditions => ['parent_id = ? AND state= ?', @tema.id, 'published'])
  end
  
  def responder
    @tema = Page.find(params[:id])
    add_response(@tema, params[:name], params[:text]).save
    @nota = 'Tu respuesta aparecerá próximamente publicada.'
    render :action => 'waiting'
  end
  
  # Crea un nuevo asunto en el foro
  def crear_tema
    foro = page_of :foro
    @tema = foro.children.build(:title => params[:title], :state => 'locked', :mime => 'tema')
    add_response(@tema, params[:name], params[:text])
    if @tema.save
      @nota = "Tu tema '#{@tema.title}' aparecerá próximamente publicado en el foro."
      render :action => 'waiting'
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
    tema.children.build(:title => name, :state => 'locked', :mime => 'respuesta', :content => body)
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

  def load_news
    @actualidad = last_page_of_mime :actualidad
    @agenda = last_page_of_mime :agenda
    @ultimo_tema = last_foro
  end
end
