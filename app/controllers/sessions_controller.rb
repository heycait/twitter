class SessionsController < ApplicationController

  def new
  end

  def create
    # Finding/creating the user using method in User Model
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
