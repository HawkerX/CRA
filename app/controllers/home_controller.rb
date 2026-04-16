
class HomeController < ApplicationController
    layout "with_side_nav"

    before_action :require_login

    def index
        response = ApiClient.getBackendHealth
        @data = response.success? ? response.parsed_response : {}
    end

    private 

    def require_login
        unless session[:user_id]
            redirect_to root_path, alert: "You must be logged in to access this page."
        end
    end
end