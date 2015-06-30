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
      config.consumer_key        = "WfLCBqb41OjVEGy42s5V54ivt"
      config.consumer_secret     = "3dcJA2ZV5Q245C8eMwHji6Sx5aw2TkEKYS4DovCsgfwMm4CZLy"
      config.access_token        = current_user.token
      config.access_token_secret = current_user.token_secret
    end
  end

  helper_method :current_user, :client
end
