# To change this template, choose Tools | Templates
# and open the template in the editor.

class Xy::VerController < ApplicationController
  include Xy::Site
  layout 'xy/xy'
  before_filter :load_roots
	
  def index
    redirect_to :action => :pagina, :id => 1
  end
	
  def pagina
    @page = Page.find(params[:id])
  end
	
  private
  def load_roots
    @roots = Page.find_all_by_parent_id(1)
  end
end
