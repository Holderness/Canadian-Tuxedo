class UsersController < ApplicationController

  before_filter :authorize, except:[:new, :create,:index,:login]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    redirect_to user_path(user)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user)
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    user = User.find(params[:id])
    user.destroy!
    redirect_to root
  end

  def login
    # handles the erb for logging in
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end