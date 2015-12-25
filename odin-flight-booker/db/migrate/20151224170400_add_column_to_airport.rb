class AddColumnToAirport < ActiveRecord::Migration
  def change
  	add_column :airports, :city, :string
  end
end
