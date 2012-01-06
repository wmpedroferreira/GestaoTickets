class PagesController < ApplicationController

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
  end
end
