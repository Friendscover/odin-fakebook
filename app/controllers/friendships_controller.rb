class FriendshipsController < ApplicationController
  def new
    @friendship = Friendship.new
  end

  def create
    @user = User.find(current_user.id)
    @friendship = @user.friendships.create(friendships_params)

    if @friendship.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def friendships_params
    params.require(:friendship).permit(:accepted_request, :friend_id)
  end
end
