require 'test_helper'

class MicropostTest < ActiveSupport::TestCase

  def setup
    @user = users(:michael)
    @micropost = @user.microposts.build(content: "Lorem ipsum")
  end

  test "should be valid" do
    assert @micropost.valid?
  end

  test "user id should be present" do
    @micropost.user_id = nil
    assert_not @micropost.valid?
  end

  test "user content should be presence" do
  	@micropost.content = "   "
  	assert_not @micropost.valid?
  end

  test "user should not have more than 140 characters for the micropost" do
  	@micropost.content = "a" * 141
  	assert_not @micropost.valid?
  end

  test "order should start by most recent micropost first" do
  	assert_equal microposts(:most_recent), Micropost.first
  end
end