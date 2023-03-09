class PostsController < ApplicationController
  def index
    @posts = Post.includes(:author).where(author_id: params[:user_id])
    @user = User.includes(:posts).find(params[:user_id])
  end

  def show
    @posts = User.find(params[:user_id]).posts.find(params[:id])
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to "/users/#{current_user.id}/posts", notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
