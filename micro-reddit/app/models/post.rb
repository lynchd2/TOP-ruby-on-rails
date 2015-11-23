class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	validates :body, presence: true, length: {minimum: 1}
	validates :title, presence: true, length: {minimum: 1, maximum:100}
	validates :user_id, presence: true
end
