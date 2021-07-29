class FriendshipsController < ApplicationController
  def new
    @friendship = Friendship.new
  end

  def create
    @user = User.find(current_user.id)
    @friendship = @user.friendships.create(friendships_params)

    redirect_to root_path
  end

  def update
    @friendship = Friendship.find(params[:id])

    if params[:commit] == 'Accept'
      @friendship.accepted_request = true
      @friendship.save
    else
      Friendship.destroy(params[:id])
    end

    redirect_to root_path
  end

  private

  def friendships_params
    params.require(:friendship).permit(:accepted_request, :friend_id)
  end
end
