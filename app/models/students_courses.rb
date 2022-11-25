class StudentsCourses < ApplicationRecord

  validates_uniqueness_of :student_id,scope: [:course_id]

  belongs_to :student
  belongs_to :course
end
