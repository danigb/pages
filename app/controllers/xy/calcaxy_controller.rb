# To change this template, choose Tools | Templates
# and open the template in the editor.

class Xy::CalcaxyController < ApplicationController
  include Xy::Site
  layout 'xy/xy'
  #caches_page :home, :booc, :files

  before_filter :load_roots
	
  def index
    redirect_to :action => 'home'
  end

  def home
    @home = Page.find(1)
  end

  def booc
    @boocs = Page.find_all_by_mime('booc')
  end

  def booc_response
    if params[:response][:mime].empty?
      redirect_to :action => 'booc'
    else
      render :text => 'please, do not spam us!'
    end
  end
  
  def works
    @files = Page.children_of(3)
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
	
  private
  def load_roots
    @roots = Page.find_all_by_parent_id(1)
  end
end
