class PagesController < ApplicationController
  def home
    if user_signed_in?
      @tweet  = current_user.tweets.build
      @tweets = current_user.feed
    end
  end
end
