class Event < ActiveRecord::Base
	belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
	has_many :invites, foreign_key: 'attended_event_id'
	has_many :attendees, through: :invites

	
	def self.past
		Event.where("date < ?", Time.now).to_a
	end

	def self.future
		Event.where("date > ?", Time.now).to_a
	end
end
