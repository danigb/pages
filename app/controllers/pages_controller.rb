class PagesController < ApplicationController
  layout 'admin'
  before_filter :load_project
  # before_filter :authenticate
  
  # GET /pages
  # GET /pages.xml
  def index 
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pages }
    end
  end

  # GET /pages/1
  # GET /pages/1.xml
  def show
    @page = @project.pages.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @page }
    end
  end

  # GET /pages/new
  # GET /pages/new.xml
  def new
    parent = params[:parent_id] ? Page.find(params[:parent_id]) : @project.page
    @page = @project.pages.build(:parent => parent)
 
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @page }
    end
  end

  # GET /pages/1/edit
  def edit
    @page = @project.pages.find(params[:id])
    @meta = Meta.new
  end

  # POST /pages
  # POST /pages.xml
  def create
    @page = @project.pages.build(params[:page])

    respond_to do |format|
      if @page.save
        flash[:notice] = 'Página creada'
        format.html { redirect_to(project_pages_path(@project)) }
        format.xml  { render :xml => @page, :status => :created, :location => @page }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pages/1
  # PUT /pages/1.xml
  def update
    @page = Page.find(params[:id])

    respond_to do |format|
      if @page.update_attributes(params[:page])
        flash[:notice] = 'Page was successfully updated.'
        format.html { redirect_to(project_pages_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @page.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def move_up
    @page = Page.find(params[:id])
    @page.move_higher
    redirect_to project_pages_url(@page.project)
  end
  
  def move_down
    @page = Page.find(params[:id])
    @page.move_lower
    redirect_to project_pages_url(@page.project)    
  end

  # DELETE /pages/1
  # DELETE /pages/1.xml
  def destroy
    @page = Page.find(params[:id])
    @page.destroy

    respond_to do |format|
      format.html { redirect_to(project_pages_url) }
      format.xml  { head :ok }
    end
  end
  
end
