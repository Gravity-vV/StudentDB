class Course < ApplicationRecord
  has_many :students


  has_many :teachers_courses,class_name: 'TeachersCourses'
  has_many :teachers,through: :teachers_courses
  #指定关联关系映射的model
  has_many :students_courses,class_name: 'StudentsCourses'
  has_many :students, through: :students_courses
end
