class EmployeeDog < ApplicationRecord
  belongs_to :dog
  belongs_to :employee
end
