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
        @business = Business.find(params[:id])
        if is_yours?(@business)
            flash[:notice] = "Your business #{@business.name} has been sucessfully deleted."
            @business.delete 
            redirect_to user_path(current_user(session))
        else 
            flash[:error] = "#{@business.name} business is not yours."
            redirect_to user_path(current_user(session))
        end
      end

  

    private 
    def business_params
        params.require(:business).permit(:name) 
    end

   
end