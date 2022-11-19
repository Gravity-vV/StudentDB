class CreateMajors < ActiveRecord::Migration[6.1]
  def change
    create_table :majors do |t|
      t.string :name
      t.integer :mno

      t.timestamps
    end
    create_table :majors_groups do |t|
      t.integer :major_id
      t.integer :group_id
      t.timestamps
    end
  end
end
