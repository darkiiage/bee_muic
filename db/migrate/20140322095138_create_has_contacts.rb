class CreateHasContacts < ActiveRecord::Migration
  def change
    create_table :has_contacts do |t|
      t.integer :event_id
      t.string :contact_name
      t.string :contact_email
      t.string :contact_phone

      t.timestamps
    end
  end
end
