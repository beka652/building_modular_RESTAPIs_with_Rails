class Api::V1::PostsController < ApplicationController
  # POST /posts
  def create
    post = Post.new(post_params)
    if post.save
      render json: post, status: :created
    else
      render json: post.errors, status: :forbidden
    end
  end

  def update
    post = Post.find(params[:id])
    if post.update(post_params)
      render json: post, status: :ok
    else
      render json: post.errors, status: :unprocessable_entity
    end
  end

 private def post_params
   params.require(:post).permit(:title, :content, :user_id)
 end
end
