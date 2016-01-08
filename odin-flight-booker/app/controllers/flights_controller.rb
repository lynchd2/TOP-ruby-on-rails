class FlightsController < ApplicationController

	def index
		@airports = Airport.all.map {|airport| [airport.city , airport.id]}
		@dates = Flight.all.order('start_time ASC').map {|flight| flight.start_time}.uniq
		@passengers = params[:passengers]
		@to_search = params[:to_airport_id]
		@from_search = params[:from_airport_id]
		@date = params[:date]
		@flights = Flight.where("to_airport_id = ? AND from_airport_id = ? AND start_time = ?", @to_search, @from_search, @date)
		if @flights.length < 1
			flash[:error] = "No flights available from those airports and that date"
		end
	end
end
