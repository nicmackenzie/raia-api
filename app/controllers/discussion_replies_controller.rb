class DiscussionRepliesController < ApplicationController
    wrap_parameters format: []
    def index
        render json: DiscussionReply.all , status: :ok
    end
    def create
        discussion_reply = DiscussionReply.create(discussion_reply_params)
        render json: discussion_reply, status: :created
    end


    private
    def discussion_reply_params
        params.permit(:id,:discussion_id,:user_id,:content,:upvotes)
    end
end
