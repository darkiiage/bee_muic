class CreateSocialLinks < ActiveRecord::Migration
  def change
    create_table :social_links do |t|
      t.string :social_name
      t.string :social_image

      t.timestamps
    end
  end
end
