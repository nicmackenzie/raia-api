class MessagesController < ApplicationController
    def index

    end
    def create
        message = Message.create!(message_params)
    end

    private
    def message_params
        params.permit(:sender_id,:receiver_id,:content)
    end
end
