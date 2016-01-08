class BookingsController < ApplicationController
	def new
		@flight = Flight.find_by(id: params[:flight_id])
		@booking = @flight.bookings.build
		params[:passengers].to_i.times do			
			@booking.passengers.new
		end
	end

	def create
		@flight = Flight.find_by(id: params[:flight_id])
		@booking = Booking.new(booking_params)
		if @booking.save
			redirect_to @booking
		end

	end

	def show
		@booking = Booking.find_by(id: params[:id])
		@flight = @booking.flight
	end

	private

	def booking_params
		params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
	end
end
