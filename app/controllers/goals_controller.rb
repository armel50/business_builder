class GoalsController < ApplicationController

    def new 
        @goal = Goal.new  
    end

    def create 
    end


    def edit 
        @goal = found_goal
    end

    def update 
    end

    def destroy 
    end

    private 
    def found_goal 
        @goal = Goal.find_by(id: params[:id])
    end

    def goal_params 
        params.require(:goal).permit(:content)
    end
end
