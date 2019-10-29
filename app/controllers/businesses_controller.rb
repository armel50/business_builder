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

  def destroy 
    @business = Business.find(params[:id])
    #is_yours and current_user can be found in the helper folder. 
    #to use an helper in the controller you need to include the name of the module in the controller: "include UsersHelper"
    if is_yours?(@business)
        flash[:notice] = "Your business #{@business.name} has been sucessfully deleted."
        @business.delete 
        redirect_to root_path
    else 
        flash[:error] = "#{@business.name} business is not yours."
        redirect_to root_path
    end
  end

   private 

   def business_params 
        params.require(:business).permit(:name, :street_name, :city,:state, :country, :password)
   end

   def category_params 
    params.require(:business).permit(categories:{})["categories"]
   end
  
end
