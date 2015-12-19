class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.string :date
      t.string :location

      t.timestamps null: false
    end
  end
end
