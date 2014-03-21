class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :phone
      t.string :faculty
      t.text   :description
      t.string :remember_token
      t.boolean :admin, default: false
      t.boolean :active, default: true

      t.timestamps
    end
    add_index :users, :email, unique: true
    add_index :users, :remember_token
  end
end