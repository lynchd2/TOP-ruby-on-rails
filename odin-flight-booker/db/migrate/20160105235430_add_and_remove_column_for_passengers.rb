class AddAndRemoveColumnForPassengers < ActiveRecord::Migration
  def change
  	remove_column :passengers, :bookings_id, :integer
  	add_column :passengers, :booking_id, :integer
  end
end
