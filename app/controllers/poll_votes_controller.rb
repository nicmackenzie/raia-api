class PollVotesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  before_action :find_poll

  def create
    if @poll.end_date < Date.today
      return render json: {error: "Voting duration for this poll is overdue"}, status: :bad_request
    else
      creator = @poll.user.full_name
      date = @poll.created_at
      description = "Participated in a poll created by #{creator} on #{date}"
      
      if PollVote.create!(vote_params).valid?
        Point.create!(user_id: @current_user.id, point_type: 'poll voting', points: 10, description: description)
        render json: {message: 'Vote submitted'},status: :created
      else
        render json: {error: 'Unable to submit vote'},status: :internal_server_error
      end
    end
  end

  private

  def find_poll
    @poll = Poll.find(params[:id])
  end

  def not_found
    render json: {error: 'Poll not found'}
  end

  def vote_params
    params.permit(:poll_option_id).merge(user_id: @current_user.id,poll_id: params[:id])
  end
end
