class TeachersCourses < ApplicationRecord

  self.table_name = 'teachers_courses'

  validates_uniqueness_of :teacher_id,scope: [:course_id]

  belongs_to :teacher
  belongs_to :course
end
