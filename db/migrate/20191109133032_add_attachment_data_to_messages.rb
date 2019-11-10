class AddAttachmentDataToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :attachment_data, :text
  end
end
