class EventDetailsController < ApplicationController
    wrap_parameters format: []
rescue_from ActiveRecord::RecordNotFound,with: :render_not_found
    def create
        event_details = EventDetail.create(event_details_params)
        render json: event_details, status: :created
    end
    def show
        event = find_event(params[:id])
        render json: event.users, status: :ok
    end

    private
    def event_details_params
        params.permit(:id,:is_attending,:user_id,:event_id,:inquiry,:inquiry_reply)
    end
    def find_event(id)
        event = Event.find(id)
    end
    def render_not_found
        render json: {"error":"Event details not found"},status: :not_found
    end
end
