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


  before_filter :load_calc
	
  def index
    redirect_to :action => 'home'
  end

  def home
    if (params[:cword])
      @calc = "c#{params[:cword]} a#{params[:aword]} l#{params[:lword]} c#{params[:ccword]}"
      Meta.new(:page_id => 1, :name => 'calc', :value => @calc).save
      redirect_to :action => 'home'
    end
    @home = Page.find(1)
  end

  def booc
    @year = params[:year].to_i
    if (@year < MIN_YEAR || @year > MAX_YEAR)
      redirect_to :action => 'booc', :year => '2008'
    else
      @years = (MIN_YEAR..MAX_YEAR).to_a.reverse!
      @years.delete 2006
      @parent = Page.find_by_title(@year, :conditions => ['parent_id = ?', PAGE_BOOC])
      @boocs = @parent.rev_children
      @comment = Page.new
      #@boocs = Page.find_all_by_mime('booc')
    end
  end

  def booc_response
    if params[:name].empty?
      page = Page.find(params[:id])
      comment = Page.new(params[:response])
      comment.mime = 'response'
      comment.parent_id = page.id
      comment.save
      redirect_to :back
    else
      render :text => "please, do not spam us!, #{params[:name]}"
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

  def load_calc
    @calc =Meta.find(:last, :conditions => ["page_id = ?", 1]).value
  end
end
