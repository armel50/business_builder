class AddAdminToBusiness < ActiveRecord::Migration[5.2]
  def change
    add_column :businesses, :admin_id, :integer
  end
end
