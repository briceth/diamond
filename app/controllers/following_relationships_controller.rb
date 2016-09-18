class FollowingRelationshipsController < ApplicationController
  before_action :set_user, only: [:create, :destroy]

  def create
    current_user.follow @user
    redirect_to @user, notice: "Now following #{@user.first_name}"
  end

  def destroy
    current_user.unfollow @user
    redirect_to @user, notice: "No longer following #{@user.first_name}"
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
