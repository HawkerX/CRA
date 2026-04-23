
class ResourcesController < ApplicationController
    layout "with_side_nav"
    def index
        response = ApiClient.getBackendHealth
        @data = response.success? ? response.parsed_response : {}
    end
end