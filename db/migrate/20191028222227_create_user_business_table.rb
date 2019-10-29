class CreateUserBusinessTable < ActiveRecord::Migration[5.2]
  def change
    create_table :user_business do |t|
      t.integer :user_id
      t.integer :business_id
    end
  end
end
