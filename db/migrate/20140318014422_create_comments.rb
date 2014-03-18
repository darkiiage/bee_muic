class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :comment_content
      t.integer :like
      t.integer :dislike
      t.integer :user_id
      t.integer :event_id

      t.timestamps
    end
    add_index :comments, [:event_id, :like, :created_at]
  end
end
