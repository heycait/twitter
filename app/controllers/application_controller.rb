class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def client
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['KEY']
      config.consumer_secret     = ENV['SECRET']
      config.access_token        = current_user.token
      config.access_token_secret = current_user.token_secret
    end
  end

  helper_method :current_user, :client
end
