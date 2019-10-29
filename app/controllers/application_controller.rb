class ApplicationController < ActionController::Base
    # before_action :logged_in? 
    # skip_before_action :logged_in?, only: [:home]
    include ApplicationHelper
    include UsersHelper
    def home 
        render "businesses/home"
    end

    private 
    def logged_in? 
        redirect_to root_path unless session[:user_id]
    end
end
