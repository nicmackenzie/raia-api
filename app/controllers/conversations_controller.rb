class ConversationsController < ApplicationController
    def show
        # @conversations = Conversation.where("user_1=? OR user_2=?",params[:id],params[:id])
        # render json: @conversations
        @conversations = Conversation
                                    .joins(:messages)
                                    .where("conversations.user_1 = ? OR conversations.user_2 = ?", params[:id], params[:id])
                                    .group("conversations.id")
                                    .order("MAX(messages.created_at) DESC")
                                    .select("conversations.*, MAX(messages.created_at) AS last_message_created_at")
  render json: @conversations
    end

    def create
        @conversation = Conversation.where(["(user_1 = ? AND user_2 = ?) 
                                              OR (user_1 = ? AND user_2 = ?)", @current_user.id, params[:receiver], params[:receiver], @current_user.id])
        if @conversation.length > 0
            render json: {conversation_id: @conversation.first.id}
        else
            @conversation = Conversation.create(user_1: @current_user.id,user_2: params[:receiver])
            Pusher.trigger('currentConversation',"message:new",{
                message: @conversation.content
            })
            render json: {conversation_id: @conversation.id},status: :created
        end
    end

    private

    def create_params
        params.permit(:receiver).merge(user_1: @current_user.id)
    end
end
