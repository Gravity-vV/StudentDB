class Course < ApplicationRecord
  has_many :students
  has_and_belongs_to_many :teachers
  #指定关联关系映射的model
  has_many :students_courses,class_name: 'StudentsCourses'
  has_many :students, through: :students_courses
end
