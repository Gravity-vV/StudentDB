class CreateTeachers < ActiveRecord::Migration[6.1]
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :tno
      t.integer :major_id
      t.timestamps
    end
  end
end
