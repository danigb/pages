class Apy::VerController < ApplicationController
  include Apy::ApySite
  layout 'apy/apy'
  before_filter :load_roots
	
  def index
    redirect_to :action => :pagina, :id => @roots.first
  end

  def buscar
    if params[:t].empty?
      redirect_to :back
    else
      @pages = []
      @area = Page.new
      @area.metas.build(:name => 'color', :value => 'red')
    end
  end
	
  def pagina
    @page = Page.find(params[:id])
    @area = area_of @page
  end
	
  private
  def load_roots
    @roots = Page.find_all_by_parent_id(1, :conditions => ["id != ?", 2])
  end
end
