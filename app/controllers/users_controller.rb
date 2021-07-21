class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(current_user.id)
    @friends = @user.friendships
  end

  def show
    @user = User.find(params[:id])
    @friends = @user.friendships
  end
end
