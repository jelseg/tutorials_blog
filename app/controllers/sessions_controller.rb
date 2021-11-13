class SessionsController < ApplicationController
    
    def new

    end

    def create
        #byebug
        user = User.find_by(email: params[:session][:email].downcase)

        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id  #session is a rails instance that can be used for session variables -> will create coocky data
            redirect_to user
        else
            flash.now[:alert] = "email password combination not found" #now because use render instead of redirect -> in same cycle
            render 'new'
        end

    end

    def destroy
        session[:user_id] = nil
        flash[:notice] = "Logged out"
        redirect_to root_path
    end

end