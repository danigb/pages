class AttachmentsController < ApplicationController
  layout 'admin'
  before_filter :load_project
  
  # GET /attachments
  # GET /attachments.xml
  def index
    @attachments = @project.attachments.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @attachments }
    end
  end

  # GET /attachments/1
  # GET /attachments/1.xml
  def show
    @attachment = @project.attachments

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @attachment }
    end
  end

  # GET /attachments/new
  # GET /attachments/new.xml
  def new
    @attachment = @project.attachments.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @attachment }
    end
  end

  # GET /attachments/1/edit
  def edit
    @attachment = @project.attachments.find(params[:id])
  end

  # POST /attachments
  # POST /attachments.xml
  def create
    @attachment = @project.attachments.build(params[:attachment])

    respond_to do |format|
      if @attachment.save
        flash[:notice] = 'Attachment was successfully created.'
        format.html { redirect_to(project_attachments_url) }
        format.xml  { render :xml => @attachment, :status => :created, :location => @attachment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @attachment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /attachments/1
  # PUT /attachments/1.xml
  def update
    @attachment = @project.attachments.find(params[:id])

    respond_to do |format|
      if @attachment.update_attributes(params[:attachment])
        flash[:notice] = 'Attachment was successfully updated.'
        format.html { redirect_to(@project, @attachment) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @attachment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /attachments/1
  # DELETE /attachments/1.xml
  def destroy
    @attachment = Attachment.find(params[:id])
    @attachment.destroy

    respond_to do |format|
      format.html { redirect_to(project_attachments_url) }
      format.xml  { head :ok }
    end
  end
end
