# To change this template, choose Tools | Templates
# and open the template in the editor.

class Xy::CalcaxyController < ApplicationController
  include Xy::Site
  layout 'xy/xy'
  #caches_page :home, :booc, :files

  MIN_YEAR = 1990
  MAX_YEAR = 2008
  PAGE_HOME = 1
  PAGE_BOOC = 2
  PAGE_BIO = 216
  PAGE_TXT = 209


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
      @years = (MIN_YEAR..MAX_YEAR).to_a.reverse!
      @parent = Page.find_by_title(@year, :conditions => ['parent_id = ?', PAGE_BOOC])
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
    @files = Page.find_all_by_mime('file', :order => 'position')
  end

  def cell
    render :action => 'home'
  end
  
  def biobiblio
    menu(PAGE_BIO)
  end

  def txts
    menu(PAGE_TXT)
  end

  private
  def menu(root_id)
    id = params[:id]
    @menu = Page.find(root_id).children
    if (id == nil)
      redirect_to  :id => @menu.first.id
    else
      @page = Page.find(id)
      if @page.parent_id != root_id
        redirect_to :id => @menu.first.id
      else
        render :action => 'txts'
      end
    end
  end

  def load_roots
    # @roots = Page.find_all_by_parent_id(1)
  end
end
