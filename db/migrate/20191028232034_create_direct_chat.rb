class CreateDirectChat < ActiveRecord::Migration[5.2]
  def change
    create_table :direct_chats do |t|
      t.string :title
      t.integer :sender_id
      t.integer :receiver_id
    end
  end
end
