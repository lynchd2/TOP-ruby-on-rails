class AddColumnToFlightsAndPassengers < ActiveRecord::Migration
  def change
  	add_column :flights, :passenger_id, :integer
  	add_column :passengers, :flight_id, :integer
  end
end
