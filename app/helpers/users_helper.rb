module UsersHelper
    def is_logged_in?(session)
        true if session[:user_id]
    end

    def current_user(session)
            @user = User.find(session[:user_id]) if is_logged_in?(session)
    end
end
