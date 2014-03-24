class CreateHasSocials < ActiveRecord::Migration
  def change
    create_table :has_socials do |t|
      t.integer :event_id
      t.string :social_links
      t.string :social_url

      t.timestamps
    end
  end
end
