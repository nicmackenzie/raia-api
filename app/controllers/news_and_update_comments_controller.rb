class NewsAndUpdateCommentsController < ApplicationController
    before_action :set_news_and_update_comment, only: [:show, :edit, :update, :destroy]
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
  
    def index
      news_and_update_comments = NewsAndUpdateComment.all
      render json: news_and_update_comments
    end
  
    def show
      render json: @news_and_update_comment
    end
  
    def create
      @news_and_update_comment = NewsAndUpdateComment.create(news_and_update_comment_params)
    
      if @news_and_update_comment.valid?
        render json: @news_and_update_comment, status: :created
      else
        render json: { error: @news_and_update_comment.errors.full_messages.join(', ') }, status: :unprocessable_entity
      end
    end
  
    def update
      if @news_and_update_comment.update(news_and_update_comment_params)
        render json:@news_and_update_comment
      else
        render json: { errors: @news_and_update_comment.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def destroy
      @news_and_update_comment.destroy
      head :no_content
    end
  
    private

    def not_found
      render json: {error: "Record not found"}
    end
  
    def set_news_and_update_comment
      @news_and_update_comment = NewsAndUpdateComment.find(params[:id])
    end
  
    def news_and_update_comment_params
      params.require(:news_and_update_comment).permit(:content, :user_id, :news_and_update_id)
    end
end