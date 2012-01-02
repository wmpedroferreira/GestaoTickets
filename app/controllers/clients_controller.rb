class ClientsController < ApplicationController
  before_filter :authenticate, :only => [:index, :edit, :new, :show]

  def index
    @clients = Client.paginate(:page => params[:page])
    @title = "All Clients"
  end
  
  def show
  	@client = Client.find(params[:id])
  	@title = @client.title
  end

  def new
    @client  = Client.new
    @title = "New Client"
  end

  def create
    @client = Client.new(params[:client])
    @client.save
    redirect_to clients_path, :flash => { :success => "SUCESSO!" }  
  end
end
