class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :name
      t.string :stuno
      t.string :birth
      t.boolean :male
      t.integer :group_id
      t.timestamps
    end
  end
end
