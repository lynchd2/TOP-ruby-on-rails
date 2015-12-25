class AddAndRemoveColumnInFlights < ActiveRecord::Migration
  def change
  	remove_column :flights, :duration
  	add_column :flights, :duration, :string
  end
end
