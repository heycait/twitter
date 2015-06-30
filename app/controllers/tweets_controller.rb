class TweetsController < ApplicationController
  def create
    # Planned on rendering json for line 6 to Ajax a new post back onto the page
    # But this single-app feature wouldn't grab new tweets. Having it live update
    # through streaming would take care of this, otherwise, just refresh page
    client.update(params[:tweet])
    redirect_to root_path
  end
end
