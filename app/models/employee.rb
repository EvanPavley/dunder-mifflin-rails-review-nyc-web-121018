class Employee < ApplicationRecord
  has_many :employee_dogs
  has_many :dogs, through: :employee_dogs

  validates :alias, :title, uniqueness: true
  validates :first_name, presence: true
end
