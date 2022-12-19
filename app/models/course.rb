class Course < ApplicationRecord
  has_many :students


  validates_uniqueness_of :cno
  validates_uniqueness_of :name


  has_many :teachers_courses,class_name: 'TeachersCourses'
  has_many :teachers,through: :teachers_courses
  #指定关联关系映射的model
  has_many :students_courses,class_name: 'StudentsCourses'
  has_many :students, through: :students_courses

  has_many :majors_courses,class_name: 'MajorsCourses'
  has_many :majors, through: :majors_courses

end
