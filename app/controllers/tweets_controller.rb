class TweetsController < ApplicationController
  before_action :set_tweet, only: %i(edit update destroy)
  def create
    @tweet = current_user.tweets.new(tweet_params)

    if @tweet.save
      redirect_to root_url, notice: 'Tweet successfully created.'
    else
      redirect_to root_url, alert: 'Error on creating new post.'
    end
  end

  def edit
  end

  def destroy
    @tweet.destroy
    redirect_to root_path, notice: 'Tweeet was successfully destroyed.'
  end  

  private

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end 

  def tweet_params
    params.require(:tweet).permit(:content)
  end
end
