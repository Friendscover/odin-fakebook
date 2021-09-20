class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(current_user.id)
    @users = User.last(20)

    @send_requests = @user.friendships
    # { |f| f.friend.first_name }
    # send requests equal user_id = current_user
    @recieved_requests = Friendship.where(friend_id: current_user.id)
    # recievedc requests equal where other users add a friend therefore they
    # added the current_user in the friend_id column

    @friends = @send_requests.map(&:friend_id)
    @friends += @recieved_requests.map(&:user_id)
    @friends.uniq!

    @posts = Post.last(10)
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user
    end
  end

  private

  def user_params
    params.require(:user).permit(:avatar)
  end
end
