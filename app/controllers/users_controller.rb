class UsersController < ApplicationController
  before_filter :authenticate, :except => [:new, :create, :newBack]
  before_filter :correct_user, :only => [:edit, :update]
  
  def index
    @users = User.paginate(:page => params[:page])
    @title = "All users"
  end
  
  def show
    @user = User.find(params[:id])
    @title = @user.name
  end

  def new
    @user  = User.new
    @title = "Sign up"
    @user.password = ""
  end

  def newBack
    @user  = User.new
    @title = "Sign up"
    @user.password = ""
  end

  def create
    @user = User.new(params[:user])
    
        
    if @user.save
      sign_in @user
      if @user.isClient?
        redirect_to new_client_path, :flash => { :success => "User created! Now create client!" }  
      else
        redirect_to @user, :flash => { :success => "User created!" }  
      end
    else
      @title = "Sign up"
      render 'new'
    end
  end
  
  def edit
    @title = "Edit user"
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to @user
    elsif
      @title = "Edit user"
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to users_path, :flash => { :success => "User destroyed." }
  end

  private

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
   
end
