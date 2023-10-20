class EventDetailsController < ApplicationController
    def create
        event_details = EventDetail.create(event_details_params)
        render json: event_details, status: :created
    end
    

    private
    def event_details_params
        params.permit(:id,:is_attending,:user_id,:event_id,:inquiry,:inquiry_reply)
    end
end
