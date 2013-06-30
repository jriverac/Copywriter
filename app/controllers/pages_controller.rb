class PagesController < ApplicationController
  # GET /pages
  # GET /pages.json
  def index
      @project = Project.find(params[:project_id])
      @pages = @project.pages.all
#      @pages = @pages.group(:parent)
#      @pages = @pages.order(:order)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pages }
    end
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
      @client = Client.find(params[:client_id])
      @project = Project.find(params[:project_id])
      @page = Page.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @page }
    end
  end

  # GET /pages/new
  # GET /pages/new.json
  def new
    @page = Page.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @page }
    end
  end

  # GET /pages/1/edit
  def edit
      @project = Project.find(params[:project_id])
      @page = Page.find(params[:id])
  end

  # POST /pages
  # POST /pages.json
  def create
    @page = Page.new(params[:page])
    @project = Project.find(@page.project_id)
    @client = Client.find(@project.client_id)

    respond_to do |format|
      if @page.save
        format.html { redirect_to client_project_page_path(@client, @project, @page), notice: 'Page was successfully created.' }
        format.json { render json: @page, status: :created, location: @page }
      else
        format.html { render action: "new" }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pages/1
  # PUT /pages/1.json
  def update

      @page = Page.find(params[:id])
      @project = Project.find(@page.project_id)
      @client = Page.find(@project.client_id)

    respond_to do |format|
      if @page.update_attributes(params[:page])
        format.html { redirect_to client_project_page_path(@client, @project, @page), notice: 'Page was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page = Page.find(params[:id])
    @project = Project.find(@page.project_id)
    @page.destroy

    respond_to do |format|
      format.html { redirect_to project_pages_path(@project) }
      format.json { head :no_content }
    end
  end
end
