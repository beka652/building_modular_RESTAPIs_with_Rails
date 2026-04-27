class Api::V1::PostsController < ApplicationController
  before_action :post, only: [ :show, :destroy, :update ]
  # GET /posts/:id
  def show
   render json: @post
  end
  # GET /posts
  def index
   render json: Post.all
  end
  # POST /posts
  def create
    post = Post.new(post_params)
    if post.save
      render json: post, status: :created
    else
      render json: post.errors, status: :forbidden
    end
  end
  # PATCH (PUT) /posts
  def update
    if @post.update(post_params)
      render json: post, status: :ok
    else
      render json: post.errors, status: :unprocessable_entity
    end
  end
  # DELETE /posts
  def destroy
    @post.destroy
    head :no_content
  end
 # whitelisting params
 private def post_params
   params.require(:post).permit(:title, :content, :user_id)
 end
 # find a post using its id and set it to @post
 private def post
   @post = Post.find(params[:id])
 end
end
