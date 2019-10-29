class Project < ApplicationRecord
    has_many :goals 
    belongs_to :department
end
