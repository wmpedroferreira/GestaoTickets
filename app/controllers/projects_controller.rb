class ProjectsController < ApplicationController
  before_filter :authenticate, :only => [:index, :edit, :new, :create, :show]
  def index
    @projects = Project.paginate(:page => params[:page])
    @title = "All Projects"
  end
  
  def show
  	@project = Project.find(params[:id])
  	@title = @project.title
    @current_project = @project
  end

  def new
    @project  = Project.new
    @title = "New Project"
  end

  def create
    @project = Project.new(params[:project])
    @project.save
    redirect_to projects_path, :flash => { :success => "SUCESSO!" }  
  end

  def edit
    @project = Project.find(params[:id])
    @title = "Edit Project"
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(params[:project])
      redirect_to @project, :flash => { :success => "Project updated." }
    else
      @title = "Edit Project"
      render 'edit'
    end
  end

end
