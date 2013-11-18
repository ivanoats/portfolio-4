class ProjectsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(params[:project])
    if @project.save
      respond_to do |format|
        format.html {  redirect_to @project  }
        format.js
      end
    else
      render :new
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(params[:project])
      respond_to do |format|
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.js
      end
    else
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url }
      format.js
    end
  end
end
