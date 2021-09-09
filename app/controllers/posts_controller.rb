class PostsController < ApplicationController
  def index
    @user = User.find(current_user.id)

    @friendships = Friendship.where(friend_id: current_user.id, accepted_request: true)
    @friends = Friendship.where(user_id: current_user.id, accepted_request: true)

    @friendships = @friendships.map(&:friend_id)
    @friendships += @friends.map(&:friend_id)


    @posts = Post.includes(:comments).where(user_id: current_user.id).or(Post.where(user_id: @friendships)).limit(10)
  end

  def show
    @post = Post.find(params[:id])

    @user_likes = @post.likes.map(&:user_id)
  end

  def new
    @post = Post.new
  end

  def create
    @post = User.find(current_user.id).posts.new(post_params)

    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
