class Admin::DepartmentsController < ApplicationController 

    def new
        @department = Department.new 
        @business = found_business
    end

    def create 
        @department = Department.new(department_params)
        @business = found_business
        @department.business = @business
        
        if @department.save 
            @business.departments << @department
            redirect_to @department
        else 
            @business = found_business
            render "admin/departments/new"
        end
    end

    def update
        p params 
    end

    def destroy 
        @business = found_business
        @department = found_department 
        if @business
            flash[:notice] = "You sucessfully deleted the #{@department.name} department." 
            @department.delete 
          
            redirect_to @business
        else 
            flash[:notice] = "This is not your business"
            redirect_to current_user(session)
        end

    end
    

    def index 
        @business =  found_business
        if @business 
            @departments = @business.departments 
                flash[:notice] = "You do not have any departments yet"   if @departments.empty? 
        end
    end

    


    private 
    def found_business 
       @business = Business.find_by(id: params[:business_id])
    end

    def found_department 
        @department = Department.find_by(id: params[:id])
    end

    def department_params 
        params.require(:department).permit(:name)
    end


end