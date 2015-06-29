class TweetsController < ApplicationController
  def create
   client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "WfLCBqb41OjVEGy42s5V54ivt"
      config.consumer_secret     = "3dcJA2ZV5Q245C8eMwHji6Sx5aw2TkEKYS4DovCsgfwMm4CZLy"
      config.access_token        = current_user.token
      config.access_token_secret = current_user.token_secret
    end
    @tweet = client.update("")
    redirect_to root_path
  end
end
