class CreateDepartment < ActiveRecord::Migration[5.2]
  def change
    create_table :departments do |t|
      t.integer :business_id
      t.string :name
    end
  end
end
