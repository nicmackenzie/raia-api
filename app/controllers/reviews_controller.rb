class ReviewsController < ApplicationController
    wrap_parameters format: []
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
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
end
