class BusinessesController < ApplicationController
  def create 
    
    @user = User.find_by(id: session[:user_id])
    @business = Business.new(business_params)
    if category_params[:category_1] != "" || category_params[:category_2] != ""
        p category_params
        category_params.each do |key, val|
            p val
            new_category = Category.find_or_create_by(name: val) if !val.empty?
            @business.categories << new_category
        end
    end
 
    @business.admin = @user

    if @business.save && @user
        flash[:notice] = "Your business has been successfully created"
        @user.businesses << @business
      
        redirect_to @business

    else
        render "/admin/businesses/new"
    end

  end

  def show 
    @business = Business.find(params[:id])
  end

   private 

   def business_params 
        params.require(:business).permit(:name, :street_name, :city,:state, :country, :password)
   end

   def category_params 
        params.require(:business).permit(:categories)
   end
  
end
