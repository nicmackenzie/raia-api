class EventAttendeesController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :validate_unprocessable_entity

    def create
        attend = EventAttendee.create!(event_attendees_params)
        if attend
            render json: {message: "Added to event attendees"},status: :created
        else
            render json: {error: "Unable to add you to event attendees"},status: :internal_server_error
        end
    end

    private

    def validate_unprocessable_entity(invalid)
        render json: {errors: invalid.record.errors.full_messages},status: :unprocessable_entity
    end

    def event_attendees_params
        # params.permit(:event_id).merge(user_id: @current_user.id)
        params.permit(:event_id,:user_id)
    end
end
