class DiscussionRepliesController < ApplicationController
    wrap_parameters format: []
    before_action :set_discussion
    def index
        @discussion_replies = @discussion.discussion_replies
        render json: @discussion_replies
      end
    def create
        discussion_reply = @discussion.discussion_replies.create(discussion_reply_params)
        render json: discussion_reply, status: :created
    end


    private
    def set_discussion
        @discussion = Discussion.find(params[:discussion_id])
      end
    def discussion_reply_params
        params.permit(:id,:discussion_id,:user_id,:content,:upvotes)
    end
end
