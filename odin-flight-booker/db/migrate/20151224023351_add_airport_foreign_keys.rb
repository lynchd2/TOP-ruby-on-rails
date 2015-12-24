class AddAirportForeignKeys < ActiveRecord::Migration
  def change
  	add_column :flights, :to_airport_id, :integer
  	add_column :flights, :from_airport_id, :integer
  end
end
