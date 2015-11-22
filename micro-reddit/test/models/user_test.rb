require 'test_helper'

class UserTest < ActiveSupport::TestCase
	def setup
		@user = User.new(name: "Lynch", email: 'lynch@lynch.com', password_digest: "foobarz1")
	end

	test "name must not be blank" do
		@user.name = ""
		assert_not @user.valid?		
	end

	test "email must be valid" do
		invalid_emails = %w[foo.bar.com fooBarz@gg foobarz@@.com]
		invalid_emails.each do |invalid_email|
			@user.email = invalid_email
			assert_not @user.valid?, "#{invalid_email.inspect} is not valid and it should be"
		end
	end

	test "password must be at least 5 characters" do
		@user.password = @user.password_confirmation = "fou1"
		assert_not @user.valid?
	end

	test "password must contain one number" do
		@user.password = @user.password_confirmation = "password"
		assert_not @user.valid?
	end
end
