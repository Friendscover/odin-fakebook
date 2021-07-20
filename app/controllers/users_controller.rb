class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(current_user.id)
    @friend_requests = @user.friendships
  end
end
