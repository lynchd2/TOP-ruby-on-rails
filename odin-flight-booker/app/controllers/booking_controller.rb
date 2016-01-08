class BookingController < ApplicationController
	def new
		@passenger = Passenger.new
		@flight = Flight.find_by(id: params[:flight_id])
		@booking = @flight.bookings.new
	end

	def create
		@booking = @flight.bookings.new(booking_params)
	end

	def show
	end

	private

	def booking_params
		params.require(:booking).permit(:flight_id, passsengers_attributes: [:name, :email])
	end
end
