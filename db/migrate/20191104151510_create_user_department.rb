class CreateUserDepartment < ActiveRecord::Migration[5.2]
  def change
    create_table :user_departments do |t|
      t.string :user_id
      t.string :department_id
    end
  end
end
