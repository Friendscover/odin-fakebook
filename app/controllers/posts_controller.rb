class PostsController < ApplicationController
  def index
    @posts = Post.last(10)
  end

  def show
    @post = Post.find(params[:id])
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
