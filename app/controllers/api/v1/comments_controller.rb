class Api::V1::CommentsController < ApplicationController
  # POST /comments
  def create
    comment = Comment.new(comment_params)
    if comment.save
      render json: comment, status: :created
    else
      render json: comment.errors, status: :unprocessable_entity
    end
  end

  def comment_params
    params.require(:comment).permit(:comment, :user_id, :post_id)
  end
end
