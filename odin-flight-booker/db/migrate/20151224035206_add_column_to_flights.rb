class AddColumnToFlights < ActiveRecord::Migration
  def change
  	add_column :flights, :duration, :datetime
  	add_column :flights, :start_time, :datetime
  end
end
