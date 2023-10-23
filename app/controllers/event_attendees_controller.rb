class EventAttendeesController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :validate_unprocessable_entity

    def show
        attendees = EventAttendee.where(event_id: params[:id])
        event = Event.find(params[:id])
        if attendees
            render json: {event: event.name, attendees: attendees }
        else
            render json: {error: "No attendees registered for event!"},error: :not_found
        end
    end
    
    def attendees
        event = Event.find(params[:id])
        attendees = event.event_attendees

        attendees_array = attendees.map do |event_attendee|
            {
                id: event_attendee.id,
                user: {
                    id: event_attendee.user.id,
                    full_name: event_attendee.user.full_name,
                    username: event_attendee.user.username,
                    profile_image: event_attendee.user.profile_image
                }
            }
        end
        render json: { event_name: event.name, host: event.user_id, attendees: attendees_array}
    end

    def create
        event = Event.find(params[:id])
        if event
            attend = EventAttendee.create!(event_attendees_params)
            if attend
                render json: {message: "Added to event attendees"},status: :created
            else
                render json: {error: "Unable to add you to event attendees"},status: :internal_server_error
            end
        else
            render json: {error: "Event does not exist!"},error: :not_found
        end
    end

    private

    def validate_unprocessable_entity(invalid)
        render json: {errors: invalid.record.errors.full_messages},status: :unprocessable_entity
    end

    def event_attendees_params
        # params.permit(:event_id).merge(user_id: @current_user.id)
        params.permit(:user_id).merge(event_id: params[:id])
    end
end
