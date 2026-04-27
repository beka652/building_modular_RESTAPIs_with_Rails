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

  def index
    render json: Comment.all
  end

  def show
    render json: Comment.find(params[:id])
  end

  # patch /comments/:id
  def update
    comment = Comment.find(params[:id])
    if comment.update(comment_params)
      render json: comment, status: :ok
    else
      render json: comment.errors, status: :unprocessable_entity
    end
  end

  private def comment_params
    params.require(:comment).permit(:comment, :user_id, :post_id)
  end
end
