class ProjectsController < ApplicationController
  before_filter :authenticate

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
    if !(current_user.id.to_s.eql?(@project.admin_id))     
        if !current_user.isAdmin? 
          if !current_user.isGestor?
             redirect_to root_path , :flash => { :success => "Cannot acess Project" }  
          end
        end
    end
  end

  def new
    @project  = Project.new
    @clients = Client.all
    @title = "New Project"
  end

  def create
    @project = Project.new(params[:project])
    puts @project.admin_id
    @c = Client.find(@project.admin_id)
    @u = User.find(@c.user_id)
    if @project.admin_id.nil?
      @project.admin_id = current_user.id
    else
      @project.admin_id = @u.id
    end
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

  def correct_user
      redirect_to(root_path) unless current_user.isAdmin? || current_user.isClient?
  end
end            