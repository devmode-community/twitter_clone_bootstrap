class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    followed = User.find(params[:user_id])
    if current_user.follow!(followed)
      redirect_to user_path(followed), notice: 'User followed with success'
    end
  end

  def destroy
    followed = User.find(params[:user_id])
    if current_user.unfollow!(followed)
      redirect_to user_path(followed), notice: 'User unfollowed with success'
    end
  end
end
