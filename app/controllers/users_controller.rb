class UsersController < ApplicationController
    validates :name, presence: true 
    validates :email, presence: true 
    validates :password, length: {minimum: 8}
end
