class TicketsController < ApplicationController
  before_filter :authenticate
  before_filter :admin_user,   :only => :destroy

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket =  Ticket.new(params[:ticket])
    @ticket.project_id = $projecto.id
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
    @logs = @ticket.logs.paginate(:page => params[:page])
    @log = Log.new
  end

  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy
    redirect_to projects_path, :flash => { :success => "Ticket deleted!" }
  end

  def active_tickets
    $active_tickets = Ticket.find(:all, :condition => { :state_id == "Open"})
  end
end