require "pry"
class DepartmentsController < ApplicationController 
    # get "/businesses/:id/view_applicants", to: "businesses#view_application"
    # get "/add/:applicant_id/departments/:id", to: "departments#add_applicants"
    def show 
        @department = Department.find(params[:id])
    end

    def add_applicants 
        user = User.find_by(id: params[:applicant_id])
        department = Department.find_by(id: params[:id])
        # binding.pry
        user_business= UserBusiness.create(user_id: user.id, business_id: department.business.id)
        user.user_businesses << user_business

        user_department = UserDepartment.create(user_id: user.id, department_id: department.id)
        user.user_departments << user_department

       application =  Application.find_by(user_id: user.id, business_id: department.business.id).destroy
       
        flash[:notice] = "#{user.name} is now part of #{department.name} department"
    # binding.pry
        redirect_to "/businesses/#{department.business.id}/view_applicants"
    
    end
end