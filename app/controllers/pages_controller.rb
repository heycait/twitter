class PagesController < ApplicationController
  def index
    if current_user
      client = Twitter::REST::Client.new do |config|
        config.consumer_key        = "WfLCBqb41OjVEGy42s5V54ivt"
        config.consumer_secret     = "3dcJA2ZV5Q245C8eMwHji6Sx5aw2TkEKYS4DovCsgfwMm4CZLy"
        config.access_token        = current_user.token
        config.access_token_secret = current_user.token_secret
      end
      @timeline = client.home_timeline
    else
      @timeline = []
    end
  end
end
