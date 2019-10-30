require "pry"
class Project < ApplicationRecord
    has_many :goals 
    belongs_to :department

    def progression_update
        
        completed = Goal.where("project_id = :id and completed = :completed ", { id: self.id , completed: true })
        
        total_goals = self.goals
      
        if total_goals.size > 0 
           result =  (completed.size.to_f / total_goals.size.to_f) * 100
        #    binding.pry
           self.update(progression: result)
        end 
    end
end
