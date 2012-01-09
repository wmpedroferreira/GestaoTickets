class TicketsController < ApplicationController
  before_filter :authenticate
  before_filter :correct_user,  :only => :show
  before_filter :admin_user,   :only => :destroy

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
      redirect_to @ticket, :flash => { :success => "Ticket created!" }
    else
      @feed_items = []
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

  def correct_user
    if current_user.isClient?
      redirect_to root_path
    end
  end
end