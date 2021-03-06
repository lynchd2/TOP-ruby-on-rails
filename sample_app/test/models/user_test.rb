require 'test_helper'

class UserTest < ActiveSupport::TestCase
	def setup
		@user = User.new(name: "Example", email: 'example@example.com', password: "foobar", password_confirmation: "foobar"
			)
	end
		
	test "should be valid" do
		assert @user.valid?
	end

	test "name should be present" do
		@user.name = "   "
		assert_not @user.valid?
	end

	test "email should be present" do
		@user.name = " "
		assert_not @user.valid?
	end

	test "name should not be too long" do
		@user.name = "a" * 51
		assert_not @user.valid?
	end

	test "email should not be too long" do
		@user.email = "a" * 244 + "@example.com"
		assert_not @user.valid?
	end

	test "email validation should accept valid addresses" do
		valid_addresses = %w[user@example.com USER@foo.com a_US-er@foo.bar.org first.last@foo.jp]
		valid_addresses.each do |v_address|
			@user.email = v_address
			assert @user.valid?, "#{v_address.inspect} should be valid"
		end
	end

	test "email address should be unique" do
		duplicate_user = @user.dup
		duplicate_user.email = duplicate_user.email.upcase
		@user.save
		assert_not duplicate_user.valid?
	end

	test "password should not be blank" do
		@user.password = @user.password_confirmation =  " " 
		assert_not @user.valid?
	end

	test "password should be a valid lengh" do
		@user.password = @user.password_confirmation =  "a" * 5
		assert_not @user.valid?
	end

	test "should delete the user and their associated microposts" do
		@user.save
		@user.microposts.create!(content: "This is a micropost")
		assert_difference 'Micropost.count', -1 do
			@user.destroy
		end

	end

	test "should follow and unfollow a user" do
		michael = users(:michael)
		archer  = users(:archer)
		assert_not michael.following?(archer)
		michael.follow(archer)
		assert michael.following?(archer)
		michael.unfollow(archer)
		assert_not michael.following?(archer)
	end

  	test "feed should have the right posts" do
	    michael = users(:michael)
	    archer  = users(:archer)
	    lana    = users(:lana)
	    # Posts from followed user
	    lana.microposts.each do |post_following|
	      assert michael.feed.include?(post_following)
	    end
	    # Posts from self
	    michael.microposts.each do |post_self|
	      assert michael.feed.include?(post_self)
	    end
	    # Posts from unfollowed user
	    archer.microposts.each do |post_unfollowed|
	      assert_not michael.feed.include?(post_unfollowed)
	    end
	  end
end
