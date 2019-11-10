require 'securerandom'
class SessionsController < ApplicationController 
    skip_before_action :logged_in?, only: [:create_with_github]
    def create_with_github 
        user = User.find_by(email: auth["info"]["email"]) 
        if user
            session[:user_id] = user.id
            flash[:notice] = "Welcome back #{user.name}!"
            redirect_to user 
        else
            user = User.create(email: auth["info"]["email"], name: auth["info"]["nickname"],password: SecureRandom.hex )
            # p user.errors.full_messages
            session[:user_id] = user.id
            flash[:notice] = "Welcome #{user.name}!"
            redirect_to user_path(user)
        end
    end

    def destroy 
        session.clear 
        redirect_to root_path
        
    end

    private 
    def auth
        request.env['omniauth.auth']
    end
end