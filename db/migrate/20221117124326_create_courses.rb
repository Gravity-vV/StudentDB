class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :cno
      t.boolean :compusory
      t.integer :start_time
      t.timestamps
    end
    create_table :teachers_courses do |t|
      t.integer :teacher_id
      t.integer :course_id
      t.timestamps
    end
    create_table :SCG do |t|
      t.integer :student_id
      t.integer :course_id
      t.integer :grade
      t.timestamps
    end
  end
end
