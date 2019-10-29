class AddFieldsToBusinesses < ActiveRecord::Migration[5.2]
  def change
    add_column :businesses, :street_name, :string 
    add_column :businesses, :city, :string 
    add_column :businesses, :state, :string  
    add_column :businesses, :country, :string  
  end
end
