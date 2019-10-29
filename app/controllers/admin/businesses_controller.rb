class  Admin::BusinessesController < ApplicationController 
    def new 
        user = User.find(session[:user_id]) if session[:user_id] 

        if user.is_admin?
            @business = Business.new
            
        else
            flash[:fail] = "You need to register as an admin to create a business."
            redirect_to user_path(user)
        end
    end

   

    def edit 
        @business = Business.find(params[:id])
    end 

    def destroy 
    end

    private 
    def business_params
        params.require(:business).permit(:name) 
    end
end