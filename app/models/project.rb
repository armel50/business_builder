require "pry"
class Project < ApplicationRecord
    has_many :goals 
    belongs_to :department

    def progression_update
        
        completed = Goal.where("project_id = :id and completed = :completed ", { id: self.id , completed: true })
        
        total_goals = Goal.where("project_id = :id ", {id: self.id })
      
        if total_goals.size > 0 
           result =  (completed.size / total_goals.size ) * 100
           self.update(progression: result)
        else
            nil
        end
    end
end
