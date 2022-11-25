class RenameCompulsoryToCompulsoryInCourse < ActiveRecord::Migration[6.1]
  def up
    rename_column :courses ,:compusory,:compulsory
  end

  def down
    rename_column :courses ,:compulsory,:compusory
  end

  create_table :students_courses do |t|
    t.integer :student_id
    t.integer :course_id
    t.integer :grade
    t.timestamps
  end

end
