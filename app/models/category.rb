class Category < ActiveRecord::Base 
    belongs_to :business
    validates :name, uniqueness: true 
end