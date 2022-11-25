class Student < ApplicationRecord
  has_many :courses
  belongs_to :group
  has_many :students_courses,class_name: 'StudentsCourses'
  #通过另一个关联关系找到一堆的课程
  has_many :courses, through: :students_courses
end
