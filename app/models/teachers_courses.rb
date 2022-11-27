class TeachersCourses < ApplicationRecord

  self.table_name = 'teachers_courses'
  #四个一起才是主键
  validates_uniqueness_of :teacher_id,
                          scope: [:course_id,:group_id,:start_time]

  belongs_to :teacher
  belongs_to :course
end
