

class UsersController < ApplicationController

  def create
    
    # binding.pry 
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to welcome_path
    else
      flash[:error] = "Authentication Failed"
      redirect_to users_new_path
    end
  end

  def new
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
