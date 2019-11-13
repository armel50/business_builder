require "pry"
class ProjectsController < ApplicationController
    
    def new 
        @project = Project.new 
        @department = found_department 
    end

    def create 
        @department = found_department
        @project = Project.new(project_params)
        p @department 
        p @project
       
        @project.department = @department

        if @project.save 
            @department.projects << @project 
            redirect_to @project
        else 
            render "projects/new"
        end
    end

    def show 
        @project = found_project
        # respond_to do |format| 
           
        #     format.js
        #     format.html
        # end
    end

    def edit
        @department = found_department  
        @project = found_project
    end

    def update 
        @project = found_project

        @project.update(project_params)
        redirect_to @project
    end



    def destroy 
        @project = found_project 
        @department = found_department 
        flash[:notice] = "Your project #{@project.name} has been sucessfully deleted"
        @project.delete 
        redirect_to @department
    end

    private 
    def found_project 
        @project = Project.find_by(id: params[:id])
    end

    def found_department 
        @department = Department.find_by(id: params[:department_id])
    end

    def project_params 
        params.require(:project).permit(:name,:description)
    end

    def goals_params 
        
    end
end
