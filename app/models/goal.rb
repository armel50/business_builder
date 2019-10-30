class Goal < ApplicationRecord
    belongs_to :project

    def is_complete?
        true if self.completed 
    end

    def toggle_check_goal  
        result = is_complete? ?  false :  true
        update(completed: result)
    end

 
   
end
