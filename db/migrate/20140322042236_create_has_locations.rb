class CreateHasLocations < ActiveRecord::Migration
  def change
    create_table :has_locations do |t|
      t.integer :event_id
      t.integer :location_id
      t.integer :floor_number
      t.string :room
      t.text :description

      t.timestamps
    end

    add_index :has_locations, :event_id
  end
end
