class AddIndexColumnForBookingsAndPassengers < ActiveRecord::Migration
  def change
  	add_column :bookings, :passenger_id, :integer
  	add_column :passengers, :bookings_id, :integer
  end
end
