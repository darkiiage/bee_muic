class AddFirstNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone, :string
    add_column :users, :faculty, :string
    add_column :users, :major, :string
    add_column :users, :description, :text
  end
end
