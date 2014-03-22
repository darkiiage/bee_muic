class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :event_name
      t.text :event_description
      t.datetime :start_date
      t.datetime :end_date
      t.integer :event_cost
      t.string :event_guest_type
      t.integer :event_guest_limit
      t.string :event_image
      t.boolean :event_food
      t.boolean :event_preregist
      t.boolean :active, defult: true
      t.integer :user_id
      
      t.string :event_type
      t.integer :location

      t.timestamps
    end
    add_index :events, [:user_id, :start_date]
  end
end