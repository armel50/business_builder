class ChatRoom < ApplicationRecord
    belongs_to :department
    has_many :messages
    has_many :users, through: :messages
end
