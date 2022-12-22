class TeachersCourses < ApplicationRecord

  self.table_name = 'teachers_courses'
  #四个一起才是主键,一位教师可以给多个班带课，但不能给一个班带多门课
  validates_uniqueness_of :teacher_id, scope: [:group_id]
  validates :teacher_id, :group_id, :course_id, presence: true
  belongs_to :teacher
  belongs_to :course
end
