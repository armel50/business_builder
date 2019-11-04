class Message < ApplicationRecord
    belongs_to :chat_room 
    belongs_to :user
    has_one_attached :file
end
