class CreateEventTypes < ActiveRecord::Migration
  def change
    create_table :event_types do |t|
      t.string :name
      t.string :image
      t.string :color

      t.timestamps
    end
  end
end
