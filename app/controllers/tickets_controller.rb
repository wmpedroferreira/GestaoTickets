class TicketsController < ApplicationController
  before_filter :authenticate
  before_filter :admin_user,   :only => [:destroy, :edit]
  before_filter :correctclient,   :only => [:show]

  def new
    @ticket = Ticket.new
    @states = [["Open"]]
    @urgencies = [["Low"], ["Medium"], ["High"]]
  end

  def new2
    @ticket = Ticket.new
    @projects = Project.all
    @states =  [["Open"]]
    @urgencies = [["Low"], ["Medium"], ["High"]]
  end


  def create
    @ticket =  Ticket.new(params[:ticket])
    if @ticket.project_id == nil      
        @ticket.project_id = $projecto.id
    end
    @ticket.user_id = current_user.id
    if @ticket.save
      redirect_to projects_path, :flash => { :success => "Ticket created!" }
    else
      render 'pages/home'
    end
  end

  def show
    @ticket = Ticket.find(params[:id])
    $current_ticket = @ticket
    @logs = @ticket.logs.paginate(:page => params[:page])
    @log = Log.new
    @states =  [["Open"], ["Being handled"],["Closed"]]
    @urgencies = [["Low"], ["Medium"], ["High"]]
  end

  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy
    redirect_to projects_path, :flash => { :success => "Ticket deleted!" }
  end

  private

  def admin_user
    if !current_user.isAdmin?
      redirect_to root_path, :flash => { :success => "Wrong permissions" }
    end
  end

  def correctclient
    if current_user.isClient? && current_user.id == params[:id]
      redirect_to projects_path, :flash => { :sucess => "Wrong permissions"}
    end
  end
end