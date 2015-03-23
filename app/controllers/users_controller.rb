class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'You successfully registered!'
      redirect_to users_path
    else
      flash[:error] = 'Errors in your submission. Try again.'
      render :new
    end
  end

private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
