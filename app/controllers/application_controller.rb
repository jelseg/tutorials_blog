class ApplicationController < ActionController::Base

    helper_method :current_user
    def current_user()
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    
    end
    
    helper_method :logged_in?
    def logged_in?
        !!current_user
    end


    def require_login
        if !logged_in?
            flash[:alert] = "you need to be logged in to view this page"
            redirect_to login_path
        end
    end

    def require_no_login
        if logged_in?
            flash[:alert] = "you are already logged in"
            redirect_to articles_path
        end
    end


end
