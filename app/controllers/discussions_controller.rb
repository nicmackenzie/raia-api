class DiscussionsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid,with: :render_record_invalid
    rescue_from ActiveRecord::RecordNotFound,with: :render_not_found
    wrap_parameters format: []
    def index
        discussions = Discussion.where(is_deleted:false)
        render json: discussions
    end
    def show
        discussion = find_discussion(params[:id])
        render json: discussion
    end
    def create
        discussion = Discussion.create(title:discussion_params[:title],content:discussion_params[:content],user_id:discussion_params[:user_id],is_deleted:false)
        render json: discussion, status: :created
    end
    def destroy
        discussion = find_discussion(params[:id])
        discussion.update(is_deleted:true)
        head :no_content
    end

    private
    def discussion_params
        params.permit(:id,:title,:content,:user_id,:is_deleted)
    end
    def render_record_invalid(invalid)
        render json: {errors:[invalid.record.errors.full_messages]},status: :unprocessable_entity
    end
    def find_discussion(id)
        discussion = Discussion.find(id)
    end
    def render_not_found
        render json: {error:"Discussion not found"},status: :not_found
    end
end
