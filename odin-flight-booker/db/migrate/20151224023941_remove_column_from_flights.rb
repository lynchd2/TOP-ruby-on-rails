class RemoveColumnFromFlights < ActiveRecord::Migration
  def change
  	remove_column :flights, :arrival
  	remove_column :flights, :departure
  end
end
