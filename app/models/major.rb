class Major < ApplicationRecord

  has_many :groups
  has_many :teachers

  has_many :majors_courses,class_name: 'MajorsCourses'
  has_many :courses, through: :majors_courses

end
