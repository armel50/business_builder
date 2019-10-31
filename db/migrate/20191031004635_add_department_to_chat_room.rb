class AddDepartmentToChatRoom < ActiveRecord::Migration[5.2]
  def change
    add_column :chat_rooms, :department_id, :integer
  end
end
