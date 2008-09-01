class Apy::VerController < ApplicationController
	layout 'apy'
	before_filter :load_roots
	
	def index
		redirect_to :action => :pagina, :id => @roots.first
	end
	
	def pagina
		@page = Page.find(params[:id])
		@area = @page.parent_id.nil? ? @page :@page.parent
	end
	
private
	def load_roots
		@roots = Page.find_all_by_parent_id(1)
	end
end
