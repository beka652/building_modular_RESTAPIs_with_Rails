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

 private def post_params
   params.require(:post).permit(:title, :content, :user_id)
 end
end
