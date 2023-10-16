class MessagesController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :render_record_invalid
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
    wrap_parameters format: []
    def show
        message = find_message(params[:id])
        render json: message, status: :ok
    end
    def create
        message = Message.create!(message_params)
        render json: message, status: :created
    end
    def destroy
        message = find_message(params[:id])
        message.destroy
        head :no_content
    end

    private
    def message_params
        params.permit(:sender_id,:receiver_id,:content)
    end
    def render_record_invalid(invalid)
        render json: {errors:[invalid.record.errors.full_messages]},status: :unprocessable_entity
    end
    def render_not_found
        render json: {error:"Message not found"},status: :not_found
    end
    def find_message(id)
        message = Message.find(id)
    end
end