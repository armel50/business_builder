class CreateSharedFiles < ActiveRecord::Migration[5.2]
  def change
    create_table :shared_files do |t|
      t.string :title
      t.text :content
      t.integer :user_id
      t.integer :chat_room_id

      t.timestamps

    end
  end
end
