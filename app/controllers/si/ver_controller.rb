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
    @page = page_of :foro
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
  
  def la
    seccion
  end
  
  def los
    seccion
  end
  
  private
  def seccion
    @name = params[:id]
    @page = page_of @name
    render :action => 'seccion'
  end
	
  def load_roots
    @content = page_of :dossier
    @news = recent_news
  end
end
