class ApplicationController < ActionController::Base

    def home 
        render "businesses/home"
    end
end
