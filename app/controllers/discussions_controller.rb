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
        discussion = Discussion.create(discussion_params)
        render json: discussion, status: :created
    end
    def destroy
        discussion = find_discussion(params[:id])
        discussion.update(is_deleted:true)
        head :no_content
    end

    private
    def discussion_params
        # params.require(:event).permit(:name, :description, :date, :county_id, :user_id)
        # event_datetime = DateTime.strptime(params[:time], "%I:%M%p")
        # date = Date.strptime(params[:date], '%Y-%m-%d')
        # time = DateTime.strptime(params[:time], '%I:%M%p')
  
        # combined_datetime = DateTime.new(date.year, date.month, date.day, time.hour, time.min, 0)
        params.permit(:id,:title,:content,:discussion_resources,:topic, :date,:end_datetime).merge(user_id: @current_user.id, is_deleted: false)
      end
  
    # def discussion_params
    #     params.permit(:id,:title,:content,:user_id,:is_deleted)
    # end
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
