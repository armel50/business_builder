class GoalsController < ApplicationController

    def new 
        @project = found_project
        @goal = Goal.new  
    end

    def create 
        @project = found_project 
        @goal = Goal.new(goal_params)
        @goal.project = @project 
        if @goal.save 
            @project.goals << @goal
            redirect_to @project
        else 
            render "goals/new"
        end
    end


    def destroy
        @project = found_project 
        @goal = found_goal 
        @goal.delete 
        redirect_to @project
    end

    private 
    def found_goal 
        @goal = Goal.find_by(id: params[:id])
    end

    def found_project 
        @project = Project.find_by(id: params[:project_id])
    end

    def goal_params 
        params.require(:goal).permit(:content)
    end
end
