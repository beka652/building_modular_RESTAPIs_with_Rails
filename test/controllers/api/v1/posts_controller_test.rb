require "test_helper"

class Api::V1::PostsControllerTest < ActionDispatch::IntegrationTest
  # Post :title, :content, :user_id
  setup do
    @user = users(:one)
    @post = posts(:one)
  end

  test "should create post" do
    assert_difference("Post.count", 1) do
      post api_v1_posts_url,
      params: { post: { title: "test_title", content: "test_content_goes_here", user_id: @user.id } },
      as: :json
    end
    assert_response :created
  end

  test "should forbid post creation" do
    assert_no_difference("Post.count") do
      post api_v1_posts_url,
      params: { post: { title: "test_title", content: "test_content_goes_here", user_id: "unkown" } },
      as: :json
    end
    assert_response :forbidden
  end

  test "should update post" do
    patch api_v1_post_url(@post),
    params: { post: { title: "test_new_title", content: "test new content", user_id: @user.id } },
    as: :json

    assert_response :success
  end

  test "should not update post" do
    patch api_v1_post_url(@post),
    params: { post: { title: "test_new_title", content: "test new content", user_id: "bad_id" } },
    as: :json

    assert_response :unprocessable_entity
  end

  test "should return a post" do
    get api_v1_post_url(@post), as: :json
    assert_response :success

    json_response = JSON.parse(response.body, symbolize_names: true)
    assert_equal @post.content, json_response[:content]
    assert_equal @post.user_id, json_response[:user_id]
    assert_equal @post.title, json_response[:title]
  end
end
