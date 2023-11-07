class DiscussionChatsController < ApplicationController
    def show
        # Pusher.trigger('discussion-channel', 'discussion-chat', {
            #   chats: @chats
            # })
        @chats = DiscussionChat.where(discussion_id: params[:id])
        if @chats
            render json: @chats
        end
    end

    def create
        @chat = DiscussionChat.create!(chat_params)
        Pusher.trigger('discussion-channel', 'discussion-chat', {
          message: @chat.message,
          id: @chat.id
        })
        render json: {message: "Success"}
        # discussion_chat = DiscussionChat.new(chat_params)
        # if discussion_chat.save!
        #     def broadcast_message
        #         ActionCable.server.broadcast('DiscussionChatsChannel',{
        #             id: 100,
        #             message: 'Some message'
        #         })
        #     end
        # end
        # render json: {message: "Success"}
    end

    private

    def chat_params
        params.permit(:message).merge(discussion_id: params[:id],user_id: @current_user.id)
    end
end
