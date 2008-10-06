# To change this template, choose Tools | Templates
# and open the template in the editor.

class Xy::CalcaxyController < ApplicationController
  include Xy::Site
  layout 'xy/xy'
  
  before_filter :load_roots
	
  def index
    redirect_to :action => 'home'
  end

  def home
  end

  def booc
    @boocs = Page.children_of(2)
  end
  
  def files
  end

  def cell
    render :action => 'home'
  end
  
  def biobiblio
    render :action => 'home'
  end

  def txts
    render :action => 'home'
  end
  
  def pagina
    @page = Page.find(params[:id])
  end
	
  private
  def load_roots
    @roots = Page.find_all_by_parent_id(1)
  end
end
