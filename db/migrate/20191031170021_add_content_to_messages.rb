class AddContentToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :content, :text
  end
end
