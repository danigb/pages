class SolidaridadController < ApplicationController
  layout 'solidaridad'
  before_filter :load_roots
	
  PROJECT_ID = 2
  AREAS = {:content => 5, :foro => 4, :agenda => 6, :actualidad => 7, :materiales => 8, :videos => 9, :enlaces => 10}
  
  def index
    redirect_to :action => :pagina, :id => AREAS[:content]
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
    @project = Project.find(PROJECT_ID)
    @content = Page.find(AREAS[:content])
    @news = Page.find(:all, :conditions => ['parent_id = ?', AREAS[:actualidad]], :order => 'position DESC', :limit => 10)
  end
end
