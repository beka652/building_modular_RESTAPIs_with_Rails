require "test_helper"

class PostTest < ActiveSupport::TestCase
  # Post :title, :content, :user_id
  setup do
    @user = users(:one)
  end

  test "should create post" do
    post = Post.new do |t|
      t.title= "Why I love rails"
      t.content= " content of goes here "
      t.user_id = @user.id
    end

    assert post.valid?
  end

  test "should not create post" do
    post = Post.new do |t|
      t.title= "Why I love rails"
      t.content= " content of goes here "
      t.user_id = "440403"
    end

    assert_not post.valid?
  end
end
