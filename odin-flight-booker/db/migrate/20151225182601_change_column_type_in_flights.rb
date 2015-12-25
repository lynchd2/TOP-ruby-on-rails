class ChangeColumnTypeInFlights < ActiveRecord::Migration
  def change
  	remove_column :flights, :start_time
  	add_column :flights, :start_time, :string
  end
end
