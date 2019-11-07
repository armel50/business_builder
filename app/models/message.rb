class Message < ApplicationRecord
    belongs_to :chat_room 
    belongs_to :user
    has_one_attached :file
    after_create_commit{
        MessageBroadcastJob.perform_later(self)
    }
end
