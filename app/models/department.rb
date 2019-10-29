class Department < ActiveRecord::Base 
    belongs_to :business 
    has_many :projects
end