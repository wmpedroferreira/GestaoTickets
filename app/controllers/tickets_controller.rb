class TicketsController < ApplicationController
  before_filter :authenticate
  before_filter :admin_user,   :only => [:destroy, :edit]
  before_filter :not_client,   :only => [:show]

  def new
    @ticket = Ticket.new
    @states = [["Open"]]
    @urgencies = [["Low"], ["Medium"], ["High"]]
  end

  def new2
    @ticket = Ticket.new
    @projects = Project.all
    @states =  [["Open"]]
    @ticket.logs = []
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
      @feed_items = []
      render 'pages/home'
    end
  end

  def show
    @ticket = Ticket.find(params[:id])
    $current_ticket = @ticket
    if !@ticket.logs.nil?
    @logs = @ticket.logs.paginate(:page => params[:page])
    end
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

  def not_client
    if current_user.isClient?
      redirect_to projects_path, :flash => { :sucess => "Wrong permissions"}
    end
  end
end