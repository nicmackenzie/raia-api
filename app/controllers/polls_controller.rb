class PollsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :validate_unprocessable_entity
    rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found
    before_action :set_poll, only: [:show]
    before_action :check_role, only: [:show]

    def index
        if params[:type] == 'ongoing' || !params[:type]
            polls = Poll.where('end_date > ?',Date.today)
        else
            polls = Poll.where(user_id: @current_user.id)
        end
        render json: polls
    end

    def create
        begin
          ActiveRecord::Base.transaction do
            @poll = Poll.new(poll_params)
            if @poll.save!
                params[:poll_options].each do |option|
                    PollOption.create!(option: option, poll_id: @poll.id)
                end
                render json: @poll, status: :created
            else
                render json: @poll.errors, status: :unprocessable_entity
            end
          end
        end        
    end

    def show
        if @poll
           render json: @poll
        end
    end

    private

    def validate_unprocessable_entity(invalid)
        render json: {errors: invalid.record.errors.full_messages},status: :unprocessable_entity
    end

    def poll_params
        params.permit(:question,:poll_options,:end_date).merge(user_id: @current_user.id)
    end

    def set_poll
        @poll = Poll.find(params[:id])
    end

    def handle_not_found
        render json: {error: 'Poll not found'},status: :not_found
    end

    def check_role
        unless @poll.user.id == @current_user.id
            render json: { error: "You don't have the necessary permissions to access this page." }, status: :forbidden
        end
    end
end
