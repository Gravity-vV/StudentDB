class Teacher < ApplicationRecord
  belongs_to :major
  has_and_belongs_to_many :courses
end
