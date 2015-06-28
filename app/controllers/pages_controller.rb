class PagesController < ApplicationController
  def index
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "WfLCBqb41OjVEGy42s5V54ivt"
      config.consumer_secret     = "3dcJA2ZV5Q245C8eMwHji6Sx5aw2TkEKYS4DovCsgfwMm4CZLy"
      config.access_token        = "417629465-mQNDWCwQacruc5WUKfs0yupfBdQbN14wekAP7JTV"
      config.access_token_secret = "M61vICNvYccgrR4zvn6BlqUnbbM0HmpNo5iD7STFF0xvH"
    end

    @timeline = client.home_timeline
  end

  def show
  end
end
