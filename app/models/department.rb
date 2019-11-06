class Department < ActiveRecord::Base 
    belongs_to :business 
    has_many :projects
    has_one :chat_room 
    has_many :user_departments 
    has_many :users, through: :user_departments

    validates :name, presence: true
end