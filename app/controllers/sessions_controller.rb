class SessionsController < ApplicationController
  def new
  end

  def create
    #find the user
    @user = User.find_by(:name => params[:user][:name])
    #authenticate
    if @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id 
      redirect_to welcome_path
    else
      flash[:error] = "Log in info invalid"
      redirect_to sessions_new_path
    end
  end

  def destroy
  end
end