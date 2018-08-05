class TweetsController < ApplicationController
  def create
    @tweet = current_user.tweets.new(tweet_params)

    if @tweet.save
      redirect_to root_url, notice: 'Post successfully created'
    else
      redirect_to root_url, alert: 'Error on creating new post'
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content)
  end
end
