class StudentsCourses < ApplicationRecord

  self.table_name = 'students_courses'

  validates_uniqueness_of :student_id,scope: [:course_id]
  validates :student_id, :course_id, :grade, presence: true
  belongs_to :student
  belongs_to :course
end
