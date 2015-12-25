class AddColumnToFlights < ActiveRecord::Migration
  def change
  	add_column :flights, :duration, :datetime
  	add_column :flights, :start_time, :datetime
  	add_column :airport, :city, :string
  end
end
