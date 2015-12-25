class FlightsController < ApplicationController

	def index
		@airports = Airport.all.map {|airport| [airport.city , airport.id]}
		@dates = Flight.all.map {|flight| flight.start_time.strftime("%m-%d-%Y")}
	end
end
