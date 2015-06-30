class TweetsController < ApplicationController
  def create
    @tweet = client.update(params[:tweet])
    redirect_to root_path
  end
end
