class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :gno
      t.integer :major_id
      t.timestamps
    end
    create_table :SC do |t|#学生班级表
      t.integer :student_id
      t.integer :group_id
      t.timestamps
    end
  end
end
