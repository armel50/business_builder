class CreateBusinesses < ActiveRecord::Migration[5.2]
  def change
    create_table :businesses do |t|
      t.string :password_digest
      t.string :name
      
      t.timestamps
 

    end
  end
end
