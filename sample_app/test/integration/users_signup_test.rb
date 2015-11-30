require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
	test "invalid signup information" do
		assert_no_difference 'User.count', 1 do
  		post users_path, user: { name:  "",
                           email: "user@invalid",
                           password:              "foo",
                           password_confirmation: "bar" }
           end
           assert_template 'users/new'
		end
end