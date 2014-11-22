class SessionsController < ApplicationController
  def login
    user = User.find_by(username:params[:user][:username])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to clothing_items_path

    else
      session[:user_id] = nil
      redirect_to root_path
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end
end