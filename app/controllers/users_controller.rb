class UsersController < ApplicationController

    # skip_before_action :logged_in?, only: [:new,:create]
    #this is for a user who do not exist in the database
    def new 
        @user = User.new
        @current_uri = request.env['PATH_INFO']
        render :layout => "signup_login"
    end
    #this is for existing users
    def login 
        @user = User.new
        @current_uri = request.env['PATH_INFO']
        render "users/new", :layout => "signup_login"
    end

    #this is where the params for the login go
    def check_user_for_loggin
        @user = User.find_by(email: user_params[:email])
        if @user 
            if @user.authenticate(user_params[:password])
                session[:user_id] = @user.id
                redirect_to @user
            else
                @user = User.new(email: user_params[:email],password: user_params[:password])
                render :login, :layout => "signup_login"  
            end
        else 
            @user = User.new(email: user_params[:email],password: user_params[:password])
            render "users/new", :layout => "signup_login"
        end
    end

    def create 
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to @user 
        else 
            render :new, :layout => "signup_login"
        end
    end

    def logout 
        session.clear
        redirect_to root_path
    end

    def index 
        @users = User.all
    end

    def show 
        @user = User.find(params[:id])
    end 

    def omniauth_login
    end

    private 
    def user_params 
        params.require(:user).permit(:name,:email,:password,:admin)
    end
    

end
