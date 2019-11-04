class ChatRoom < ApplicationRecord
    belongs_to :department
    has_many :users, through: :department
    has_many :messages, through: :users
end
