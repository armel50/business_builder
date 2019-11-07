require "pry"
class GoalsController < ApplicationController

    def new 
        @project = found_project
        @goal = Goal.new  
    end

    def create 
        @project = found_project 
        @goal = Goal.new(goal_params)
        @goal.project = @project
        if goal_exist?(project: @project, goal: @goal) 
            flash[:notice] = "The goal, '#{@goal.content}' is already defined for project #{@project.name}"
            

        else 
            if @goal.save 
                @project.goals << @goal
                @project.progression_update
            else
                render "goals/new"    
            end
        end 

      
        redirect_to @project
        
    end


    def destroy
        @project = found_project 
        @goal = found_goal 
        @goal.delete 
        @project.progression_update 
        redirect_to @project
    end

    def check_goal
        
        @goal = Goal.find_by(id: params.permit(:goal_id)[:goal_id])
        @project = found_project
         @goal.toggle_check_goal
        # binding.pry 
         @project.progression_update 
       
        redirect_to @project
        


    end

    private 
    def found_goal 
        Goal.find_by(id: params[:id])
    end

    def found_project 
         Project.find_by(id: params[:project_id])
    end

    def goal_params 
        params.require(:goal).permit(:content)
    end

    def goal_exist?(project:, goal: ) 
        project.goals.find_by(content: goal.content)
    end
    
end
