class Api::V1::CommentsController < ApplicationController
  before_action :comment, only: [ :update, :show, :destroy ]
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
    render json: @comment
  end

  def update
    if @comment.update(comment_params)
      render json: comment, status: :ok
    else
      render json: comment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy
    head :no_content
  end

  private def comment_params
    params.require(:comment).permit(:comment, :user_id, :post_id)
  end

  private def comment
    @comment = Comment.find(params[:id])
  end
end
