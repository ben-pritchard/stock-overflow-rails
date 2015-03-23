class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @questions = Question.all
  end

  def create
    @user = User.new(user_params)
    if !@user.is_email?
      flash[:alert] = "Please provide a valid email address."
      redirect_to :back
    elsif @user.save
      flash[:notice] = "Welcome to Stock Overflow!"
      redirect_to "/"
    else
      flash[:alert] = "There was a problem creating your account. Please try again."
      redirect_to :back
    end
  end


private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
