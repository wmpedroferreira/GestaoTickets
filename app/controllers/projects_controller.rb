class ProjectsController < ApplicationController
  before_filter :authenticate, :only => [:index, :edit, :new, :show]
  def index
    @projects = Project.paginate(:page => params[:page])
    @title = "All Projects"
  end
  
  def show
  	@project = Project.find(params[:id])
  	@title = @project.title
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
end
