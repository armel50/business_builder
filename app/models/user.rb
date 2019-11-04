class User < ApplicationRecord
    validates :name, presence: true 
    validates :email, presence: true, uniqueness: true
    validates :password, length: {minimum: 8}

    has_secure_password

    has_many :user_businesses
    has_many :businesses, through: :user_businesses
    has_many :departments, through: :businesses
    has_many :applications
    has_many :user_departments 
    has_many :departments, through: :user_departments

    has_many :chat_rooms, through: :department
    has_many :notifications, through: :department
    has_many :messages

    def is_admin? 
        self.admin ? true : false
    end
end
