class Api::V1::PostsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_user

  def index
    @posts = @user.posts.includes(:author)

    render json: @posts.to_json(include: :comments)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
