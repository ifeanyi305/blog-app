class Api::V1::CommentsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_post, only: %i[create index]

  def index
    @comments = @post.comments.includes(:author)

    render json: @comments
  end

  def create
    @comment = @post.comments.create(comment_params)
    @comment.author_id = current_user.id # set owner of coment to the current user

    if @comment.save
      render json: @comment, status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
