class DiscussionPollsController < ApplicationController
    wrap_parameters format: []
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
rescue_from ActiveRecord:::RecordInvalid, with: :render_record_invalid
    def create
        discussion_poll = DiscussionPoll.create(discussion_polls_params)
        render json: discussion_poll,status: :created
    end
    def update
        discussion_poll = find_discussion_poll(params[:id])
        discussion_poll.update(votes:discussion_poll.votes+=1)
        render json: discussion_poll
    end
    def index
        render json: DiscussionPoll.all, status: :ok
    end
    def destroy
        discussion_poll = find_discussion_poll(params[:id])
        if session[:user_id] == discussion_poll.id
            discussion_poll.destroy
            head :no_content
        else
            render json: {"error":"unauthorized action"},status: :unauthorized
        end
    end


    private
    def discussion_polls_params
        params.permit(:user_id,:discussion_id,:title,:votes)
    end
    def find_discussion_poll(id)
        discussion_poll = DiscussionPoll.find(id)
    end
    def render_not_found
        render json: {"error":"discussion poll not found"},status: :not_found
    end
    def render_record_invalid(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
end
