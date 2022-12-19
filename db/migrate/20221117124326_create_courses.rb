class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :cno
      t.timestamps
    end
    create_table :teachers_courses do |t|
      t.integer :teacher_id
      t.integer :course_id
      t.integer :group_id
      t.integer :start_time
      t.timestamps
    end

  end
end
