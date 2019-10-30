class Department < ActiveRecord::Base 
    belongs_to :business 
    has_many :projects
    has_one :chat_room 


    validates :name, presence: true
end