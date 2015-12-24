class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.string :arrival
      t.string :departure

      t.timestamps null: false
    end
  end
end
