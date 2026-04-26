require "test_helper"

class Api::V1::PostsControllerTest < ActionDispatch::IntegrationTest
  # Post :title, :content, :user_id
  setup do
    @user = users(:one)
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
end
