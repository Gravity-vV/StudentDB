class Group < ApplicationRecord

  has_many :students
  belongs_to :major
end
