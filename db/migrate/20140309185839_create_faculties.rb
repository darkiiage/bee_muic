class CreateFaculties < ActiveRecord::Migration
  def change
    create_table :faculties do |t|
      t.string :faculty_name
      t.string :faculty_short_name
      t.string :faculty_type

      t.timestamps
    end
  end
end
