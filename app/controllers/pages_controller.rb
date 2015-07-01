class PagesController < ApplicationController
  def index
    if current_user
      # Calling the home_timeline method on the client helper method
      @timeline = client.home_timeline
    else
      redirect_to signin_path
    end
  end
end
