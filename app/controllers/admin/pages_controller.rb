class Admin::PagesController < Admin::AdminController
  layout 'admin'
  # before_filter :authenticate
  
  # GET /pages
  # GET /pages.xml
  def index 
    @page = Page.find(1)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pages }
    end
  end

  # GET /pages/1
  # GET /pages/1.xml
  def show
    @page = Page.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @page }
    end
  end

  # GET /pages/new
  # GET /pages/new.xml
  def new
    parent = Page.find(params[:parent_id])
    @page = Page.new(:parent => parent)
 
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @page }
    end
  end

  # GET /pages/1/edit
  def edit
    @page = Page.find(params[:id])
  end
  
  def meta
    @page = Page.find(params[:id])
    @meta = @page.metas.build
  end

  # POST /pages
  # POST /pages.xml
  def create
    @page = Page.new(params[:page])

    respond_to do |format|
      if @page.save
        flash[:notice] = 'Página creada'
        format.html { redirect_to admin_pages_path }
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
        format.html { redirect_to admin_pages_url }
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
    redirect_to :back
  end
  
  def move_down
    @page = Page.find(params[:id])
    @page.move_lower
    redirect_to :back
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
