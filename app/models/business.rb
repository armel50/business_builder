class Business < ApplicationRecord
  
    validates :name, uniqueness: true 
    validates :password, length: {minimum: 8}
    has_secure_password
    belongs_to :admin, class_name: "User", foreign_key: :admin_id
    has_many :user_businesses
    has_many :users, through: :user_businesses
    has_many :departments
    has_many :projects, through: :departments
    has_many :goals, through: :projects 
    has_many :chatrooms, through: :departments 
    has_many :sharedfiles, through: :departments 
    has_many :notifications, through: :departments
    has_many :categories


    def founder_name
        self.admin.name
    end
end
