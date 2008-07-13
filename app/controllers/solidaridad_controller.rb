class SolidaridadController < ApplicationController
  include SolidaridadSite
  layout 'solidaridad'
  before_filter :load_project, :load_roots
	
  
  def index
    redirect_to :action => :pagina, :id => AREAS[:contenido]
  end
        
  def pagina
    @page = Page.find(params[:id])
  end
    
  def foro
    @page = Page.find(AREAS[:foro])
    @items = Page.find(:all, :conditions => ['parent_id = ?', @page.id], :order => 'position DESC')
  end
  
  # muestra un asunto del foro
  def asunto
    @page = Page.find(params[:id])
  end
  
  def nuevo_asunto
    @asunto = Page.find(params[:id])
    post = @asunto.children.create(:title => @asunto.title)
    if post.save
      content = post.contents.create(:data => params[:post][:content])
      content.save
      redirect_to :action => asunto, :id => @asunto.id
    end
  end
  
  def ver
    @name = params[:id]
    @page = Page.find(AREAS[@name.to_sym])
  end
	
  private
  def load_roots
    @content = page_of :contenido
    @news = recent_news
  end
end
