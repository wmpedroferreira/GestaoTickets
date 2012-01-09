class PagesController < ApplicationController
  before_filter :authenticate,  :only => [:tickets]
  before_filter :not_client,   :only => [:tickets]
  def home
    @title = "Home"
    if signed_in?
      
    end
  end

  def contact
    @title = "Contact"
  end
  
  def about
    @title = "About"
  end
  
  def help
    @title = "Help"
  end

  def tickets
    $active_tickets = Ticket.where( :state_id => "Open")
    @ticket = Ticket.new
  end

  private

  def not_client
    if current_user.isClient?
      redirect_to root_path , :flash => { :success => "Cannot acess active Tickets" } 
    end 
  end
end
