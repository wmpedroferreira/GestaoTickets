class PagesController < ApplicationController
  before_filter :authenticate,  :only => [:tickets]
  before_filter :not_client,   :only => [:tickets]
  def home
    @title = "Home"
    if signed_in? 
      $pending_messages = Message.find(:all, :conditions => {:deliver_id => current_user.id, :read => false})
    end
  end

  def contact
    @title = "Contact"
  end
  

  def about
    @title = "About"
  end
  
  def messages
    if signed_in?
      render :partial => 'pages/messages'
    end
  end

  def remove
    @message = Message.find(Integer(params[:message]))
    @message.read = true
    @message.save
    redirect_to root_path
  end

  def help
    @title = "Help"
  end

  def newmessage
    @message = Message.new
    @title = "New Message"
    @users = (current_user.blank? ? User.all : User.find(:all, :conditions => ["id != ?", current_user.id]))  
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
