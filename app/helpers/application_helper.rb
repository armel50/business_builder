module ApplicationHelper
    def loggin_page?(path)
        if path == "/users/new" || path == "/users"
            "Sign-up for a new account"
        else path == "/logIn"
            "Log-in to your account"
        end
    end

    def display_logout(klass)
        if session[:user_id]
            link_to("Logout",logout_path, html_options = {class: klass})
        else
            nil
        end
    end
end
