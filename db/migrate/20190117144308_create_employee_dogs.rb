class CreateEmployeeDogs < ActiveRecord::Migration[5.1]
  def change
    create_table :employee_dogs do |t|
      t.integer :employee_id
      t.integer :dog_id
      t.timestamps
    end
  end
end
