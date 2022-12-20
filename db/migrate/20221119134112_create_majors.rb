class CreateMajors < ActiveRecord::Migration[6.1]
  def change
    create_table :majors do |t|
      t.string :name
      t.string :mno

      t.timestamps
    end
    create_table :majors_courses do |t|
      t.integer :major_id
      t.integer :course_id
      t.float :credit
      t.boolean :compulsory
      t.timestamps
    end
    create_table :students_courses do |t|
      t.integer :student_id
      t.integer :course_id
      t.float :grade
      t.timestamps
    end
  end
end
