class ApyController < ApplicationController
	layout 'apy'
	before_filter :load_roots
	
	def index
		redirect_to :action => :pagina, :id => @roots.first
	end
	
	def pagina
		@page = Page.find(params[:id])
		@area = @page.area
	end
	
private
	def load_roots
                @project = Project.find(1)
		@roots = Page.find(:all, :conditions => ['parent_id IS NULL AND project_id=1'], :order => 'position')
	end
end
