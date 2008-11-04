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
    @page = Page.find(PAGE_BIO)
    render :action => 'biobiblio'
  end

  def txts
    id = params[:id]
    @texts = Page.find(PAGE_TXT).children
    if (id == nil)
      redirect_to :action => 'txts', :id => @texts.first.id
    else
      @page = Page.find(id)
      redirect_to :action => 'txts', :id => @texts.first.id if @page.parent_id != PAGE_TXT
    end
  end
	
  private
  def load_roots
   # @roots = Page.find_all_by_parent_id(1)
  end
end
