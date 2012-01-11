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
    if @ticket.user_id == nil
      @ticket.user_id = current_user.id
    end
    @p = Project.find(@ticket.project_id)
    puts @ticket.user_id
    puts @p.admin_id
    if !current_ticket.isAdmin?
        if !(@ticket.user_id == @p.admin_id)
          redirect_to projects_path, :flash => { :fail => "Cannot insert ticket in that project!" }
        end
    end
    if @ticket.save
      redirect_to projects_path, :flash => { :success => "Ticket created!" }
    else
      redirect_to projects_path, :flash => { :fail => "Error creating ticket!" }
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