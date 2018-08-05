class UsersController < ApplicationController
  def index
    @users = User.all.where.not(id: current_user.id)
  end

  def show
    @user = User.friendly.find(params[:id])
    @tweets = @user.tweets
  end
end
