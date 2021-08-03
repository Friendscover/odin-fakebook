class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(current_user.id)
    @users = User.last(20)

    @friend_ids = @user.friendships.map(&:friend_id)

    @posts = Post.last(10)
  end

  def show
    @user = User.find(params[:id])
  end
end
