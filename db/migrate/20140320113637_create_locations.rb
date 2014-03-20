class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.integer :map_number
      t.string :location_name

      t.timestamps
    end
  end
end
