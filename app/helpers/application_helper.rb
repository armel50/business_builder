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

    def is_yours?(element) 
        user = User.find_by(id: session[:user_id])
         user.id == element.author_id ? true : false
         
    end

    def display_admin_or_simple_user_links(klass,session)
        if current_user(session)
            @user = current_user(session)
            if @user.is_admin? 
                [link_to("Create a new business", new_admin_businesses_path, html_options = {class: klass}), link_to("Show my businesses","#",html_options={class: klass}), link_to("Delete a business","#",html_options={class: klass}), link_to("Chat Rooms by business","#",html_options={class: klass}), link_to("Direct chat","#",html_options={class: klass}), link_to("Employee willing to work for you","#",html_options={class: klass}), link_to("See your employees","#",html_options={class: klass}), link_to("Find an employee","#",html_options={class: klass}), link_to("See your projects by business","#",html_options={class: klass}), link_to("See your goals by business","#",html_options={class: klass}), link_to("Logout","#",html_options={class: klass}) ]  
            else
                [link_to("My businesses", "#", html_options={class: klass}), link_to("Leave a business","#",html_options={class: klass}), link_to("My projects by business","#",html_options={class: klass}), link_to("My goals by business","#",html_options={class: klass}), link_to("My chat rooms by business","#",html_options={class: klass}) , link_to("Direct chat","#",html_options={class: klass}), link_to("My departments by business","#",html_options={class: klass}), link_to("Apply for a business","#",html_options={class: klass}), link_to("Logout","#",html_options={class: klass})]
            end
        end
    end
end
