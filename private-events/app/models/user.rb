class User < ActiveRecord::Base
	has_many :events
	has_many :invites, foreign_key: 'attendee_id'
	has_many :attended_events, through: 'invites'

	def self.previous_event(user)
		user.attended_events.to_a.find_all do |attended_evnet|
			attended_event.date < Time.now
		end
	end


	def self.upcoming_event(user)
		user.attended_events.to_a.find_all do |attended_evnet|
			attended_event.date > Time.now
		end
	end
end