class ReviewsController < ApplicationController
    wrap_parameters format: []
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
rescue_from ActiveRecord::RecordInvalid,with: :render_record_invalid
before_action :check_leader, only: [:by_leader]

    def index
        render json: Review.all, status: :ok
    end
    def create
        review = Review.create(review_params)
        render json: review, status: :created
    end
    def show
        review = find_review(params[:id])
        render json: review
    end
    def destroy
        review = find_review(params[:id])
        review.destroy
        head :no_content
    end
    def by_leader
        if params[:category]
            reviews = Review.where(leader_id: @current_user.id,category: params[:category])
        else
            reviews = Review.where(leader_id: @current_user.id)
        end
        # render json: {data: reviews.page(params[:page]).per(10),total_pages: reviews.total_pages}
        render json: reviews
    end
    private
    def review_params
        params.permit(:id,:content,:rating,:category,:leader_id,:reviewer_id)
    end
    def find_review(id)
        review = Review.find(id)
    end
    def render_not_found
        render json: {error:"Review Not Found"},status: :not_found
    end
    def render_record_invalid(invalid)
        render json: {errors:invalid.record.errors.full_messages}
    end
    def check_leader
        unless @current_user&.role == 'leader' && @current_user.verified
            render json: {error: "You are don't have required permissions to perform this task"}
        end
    end
end
