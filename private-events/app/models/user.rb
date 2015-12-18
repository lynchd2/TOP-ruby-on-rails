class User < ActiveRecord::Base
	validates :name, presence: true, length: { minimum: 5 , maximum: 50 }
end
