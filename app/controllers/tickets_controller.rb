class TicketsController < ApplicationController
  
  def new
    @ticket = Ticket.new
  end

  def create
    @ticket =  Ticket.new(params[:ticket])
    @ticket.project_id = $projecto.id
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
end