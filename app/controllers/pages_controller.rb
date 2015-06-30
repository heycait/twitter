class PagesController < ApplicationController
  def index
    if current_user
      @timeline = client.home_timeline
    else
      @timeline = []
    end
  end
end
