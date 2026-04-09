
class LoginController < ApplicationController
    def index
        #@see views/login/index.html.erb
    end

    def create
        #@TODO implement auth0 check for admin user
        user_id = "3k2lj432l4jll"

        if params[:email] == "admin@admin.com" && params[:password] == "password"
            session[:user_id] = user_id
            redirect_to "/home"
        else
            flash[:alert] = "Invalid Login"
            render :index
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to root_path
    end
end