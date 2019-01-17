class Dog < ApplicationRecord
  has_many :employee_dogs
  has_many :employees, through: :employee_dogs
end
