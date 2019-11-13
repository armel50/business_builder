require "pry"
class BusinessesController < ApplicationController


  def create 
    
    @user = User.find_by(id: session[:user_id])
    @business = Business.new(business_params)

    #business has only one admin
    @business.admin = @user

    if @business.save && @user
        flash[:notice] = "Your business has been successfully created"
        # the following code create categories and associate them to the business
        if category_params[:category_1] != "" || category_params[:category_2] != ""
            category_params.each do |key, val|
                new_category = Category.find_or_create_by(name:  category_params[key]) if !category_params[key].empty?
                @business.categories << new_category 
            end
        end

        @user.businesses << @business
        redirect_to @business
    else
        render "/admin/businesses/new"
    end
  end

  def show 
    @business = Business.find(params[:id])
  end

  def view_application

    if current_user(session).admin
      @business = Business.find_by(id: params[:id])
      @businesses = Business.where("admin_id = :admin_id",  admin_id: current_user(session).id)
      @applications = Application.where("business_id = :business_id", business_id: @business.id)
      @applicants = []
      if @applications 
        @applications.each do |application|
          @applicants << application.user
        end
        render "businesses/view_new_applicants"
      end
    else 
      flash[:notice] = "You're not allowed to see those content."
      redirect_to  current_user(session)
    end
  end

  def index
    if  params.permit("business_name1")["business_name1"]
     @businesses = Business.where("name like ?", "%#{params.permit("business_name1")["business_name1"]}%")
      @search_term = params.permit("business_name1")["business_name1"]
     @application = Application.new
      elsif !params[:user_id]
        @application = Application.new
        @businesses =  Business.all
      elsif params[:user_id]
      @businesses =  current_user(session).businesses
      if @businesses.empty?
          flash[:notice] = "You do not have a business yet. If you are an admin set up your business, otherwise apply to a business." 
          redirect_to "/businesses"
      end
    end 

    # binding.pry
  end

  def terminate 
    @user = User.find_by(id: params[:user_id])

    @department = Department.find_by(id: params[:id])

    @business = @department.business
   
    @user_business = UserBusiness.find_by(user_id: @user.id, business_id: @business.id)
    @user_department = UserDepartment.find_by(user_id: @user.id, department_id: @department.id)
    flash[:notice] = "#{@user.name.capitalize} is not part of #{@business.name.capitalize} anymore."
    @user_business.delete if @user_business
    @user_department.delete 
    
    redirect_to @business
  end


  
  # post "/businesses/:id/apply", to: "businesses#create_application"

  
  # delete "/businesses/:id/apply", to: "businesses#destroy_application"


  def create_application 
    @user = current_user(session)
    @business = Business.find_by(id: params[:id])
   if !@user.admin
      @application = Application.create(business_id: @business.id, user_id: current_user(session).id)
      # binding.pry
      flash[:notice] = "Your application hass been successfully submitted to #{@business.name} business"
   else 
    flash[:notice] = "You are an administrator. Please log in without you admin account to apply to '#{@business.name}' business"
   end
   redirect_to "/businesses"
  end



  def destroy_application
    @business = Business.find_by(id: params[:id])
    application = Application.find_by(business_id: @business.id, user_id: current_user(session).id)
    # binding.pry
    flash[:notice] = "Your application has been successfully deleted"
    
    application.delete 
    redirect_to "/businesses"
  end

   private 

   def business_params 
        params.require(:business).permit(:name, :street_name, :city,:state, :country, :password)
   end

   def category_params 
    params.require(:business).permit(categories:{})["categories"]
   end
  


 
 

  private 
 
end
