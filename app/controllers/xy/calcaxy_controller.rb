# To change this template, choose Tools | Templates
# and open the template in the editor.

class Xy::CalcaxyController < ApplicationController
  include Xy::Site
  layout 'xy/xy'
  #caches_page :home, :booc, :files

  MIN_YEAR = 1990
  MAX_YEAR = 2008

  before_filter :load_roots
	
  def index
    redirect_to :action => 'home'
  end

  def home
    @home = Page.find(1)
  end

  def booc
    @year = params[:year].to_i
    if (@year < MIN_YEAR || @year > MAX_YEAR)
      redirect_to :action => 'booc', :year => '2008'
    else
      @years = MAX_YEAR.downto MIN_YEAR
      @parent = Page.find_by_title(@year, :conditions => ['parent_id = ?', 2])
      @boocs = @parent.children
      #@boocs = Page.find_all_by_mime('booc')
    end
  end

  def booc_response
    if params[:response][:mime].empty?
      redirect_to :action => 'booc'
    else
      render :text => 'please, do not spam us!'
    end
  end
  
  def works
    @files = Page.find_all_by_mime('file')
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
