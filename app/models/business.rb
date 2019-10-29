class Business < ApplicationRecord
    has_many :user_businesses
    has_many :users, through: :user_businesses
    has_many :departments
    has_many :projects, through: :departments
    has_many :goals, through: :projects 
    has_many :chatrooms, through: :departments 
    has_many :sharedfiles, through: :departments 
    has_many :notifications, through: :departments
end
