class DiscussionsController < ApplicationController
    wrap_parameters format: []
    def index
        discussions = Discussion.where(is_deleted:false)
        render json: discussions
    end
    def create
        discussion = Discussion.create(discussion_params)
        render json: discussion, status: :created
    end

    private
    def discussion_params
        params.permit(:id,:title,:content,:user_id,:is_deleted)
    end
end
