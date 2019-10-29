class Department < ActiveRecord::Base 
    belongs_to :business 
    has_many :projects

    validates :name, presence: true
end