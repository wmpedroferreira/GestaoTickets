class ProjectsController < ApplicationController
  before_filter :authenticate
  before_filter :admin_user,   :only => [:new, :create, :edit]

  def index
    @projects = Project.paginate(:page => params[:page])
    @title = "All Projects"
  end
  
  def show
  	@project = Project.find(params[:id])
    @title = @project.title
    $projecto = @project
    @store = Ticket.find(:all, :conditions => { :project_id  => @project.id })
    @tickets = @store.paginate(:page => params[:page])
  end

  def new
    @project  = Project.new
    @clients = Client.all
    @title = "New Project"
  end

  def create
    @project = Project.new(params[:project])
    @project.admin_id = current_user.id
    @project.save
    redirect_to projects_path, :flash => { :success => "SUCESSO!" }  
  end

  def edit
    @project = Project.find(params[:id])
    @clients = Client.all
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

  def newticket
    render 'newticket'
  end

  private

  def admin_user
      redirect_to(root_path) unless current_user.isAdmin?
  end
end            