class User < ActiveRecord::Base
	has_many :posts
	has_many :comments
	validates :name, presence: true
	VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, 
			  format: {with: VALID_EMAIL}, 
			  uniqueness: {case_sensitive: false}
	has_secure_password
	CONTAINS_ONE_NUMBER = /\A(?=.*\d)/x
	validates :password, length: {minimum: 5},
			  format: {with: CONTAINS_ONE_NUMBER}

end
