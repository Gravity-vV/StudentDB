class Teacher < ApplicationRecord
  belongs_to :major
  has_many :teachers_courses,class_name: 'TeachersCourses'
  #通过另一个关联关系找到一堆的课程
  has_many :courses, through: :students_courses
end
