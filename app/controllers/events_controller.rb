
class EventsController < ApplicationController
    layout "with_side_nav"
    def index
        response = ApiClient.getEvents
        @data = response.success? ? response.parsed_response : {}
    end
    def show
        id = params[:id]
        @event = ApiClient.getEvent(id);
    end 
    def update
        data = params.require(:data)
                    .permit(
                        :id, 
                        :title, 
                        :description, 
                        :location, 
                        :organizer,
                        :date,
                        :latitude,
                        :longitude
                    )
        ApiClient.postEvent(data.to_h)
    end
end