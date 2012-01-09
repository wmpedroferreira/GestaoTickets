class ClientsController < ApplicationController
  before_filter :authenticate, :only => [:index, :show]
  before_filter :client_user,   :only => [:new, :create]

  def index
    @clients = Client.paginate(:page => params[:page])
    @title = "All Clients"
  end
  
  def show
  	@client = Client.find(params[:id])
  	@title = @client.name
  end

  def new
    @client = Client.new
    @title = "New Client"
  end

  def create
    @client = Client.new(params[:client])
    @client.save
    redirect_to clients_path, :flash => { :success => "Worked created Client" }  
  end


  private

  def client_user
      redirect_to(root_path) unless current_user.isClient?
    end

end
