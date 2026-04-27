require "test_helper"

class CommentTest < ActiveSupport::TestCase
  setup do
    @post = posts(:one)
    @user = users(:one)
  end

  test "should create comment" do
    comment = Comment.new(comment: "test comment", post_id: @post.id, user_id: @user.id)
    assert comment.valid?
  end

  test "should not create comment" do
    comment = Comment.new(comment: "test comment", post_id: 124, user_id: 234)
    assert_not comment.valid?
  end
end
