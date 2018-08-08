class RelationshipsController < ApplicationController
  before_action :authenticate_user!, :set_followed

  def create
    if current_user.follow!(@followed)
      redirect_to user_path(@followed), notice: 'User followed with success'
    end
  end

  def destroy
    if current_user.unfollow!(@followed)
      redirect_to user_path(@followed), notice: 'User unfollowed with success'
    end
  end

  private

  def set_followed
    @followed = User.find(params[:id])
  end
end
