class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @posts = Post.includes(:author).where(author_id: params[:user_id])
    @user = User.includes(:posts).find(params[:user_id])
  end

  def show
    @posts = User.find(params[:user_id]).posts.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(title: params[:post][:title], text: params[:post][:text], author: current_user, likes_counter: 0, comments_counter: 0)
    if @post.save
      redirect_to "/users/#{current_user.id}/posts", notice: 'Post was successfully created.'
    else
      p @post.errors
    end
  end

  def destroy
    @post = Post.find(params[:id])
    authorize! :destroy, @post
    @post.destroy
    redirect_to "/users/#{current_user.id}/posts", notice: 'Post was successfully deleted.'
  end
  
  private

  def post_params
    params.require(:post).permit(:title, :text, author: current_user, likes_counter: 0, comments_counter: 0)
  end
end
