class MajorsCourses < ApplicationRecord

  self.table_name = 'majors_courses'

  validates_uniqueness_of :major_id,scope: [:course_id]

  validates  :course_id, presence: true
  # validates  :compulsory, presence: true
  validates  :credit, presence: true
  belongs_to :major
  belongs_to :course
end
