class DiscussionPollsController < ApplicationController
    def create
        discussion_poll = DiscussionPoll.create(discussion_polls_params)
        render json: discussion_poll,status: :created
    end
    def update
        discussion_poll = find_discussion_poll(params[:id])
        discussion_poll.update(votes:discussion_poll.votes+=1)
        render json: discussion_poll
    end



    private
    def discussion_polls_params
        params.permit(:user_id,:discussion_id,:title,:votes)
    end
    def find_discussion_poll(id)
        discussion_poll = DiscussionPoll.find(id)
    end
end
