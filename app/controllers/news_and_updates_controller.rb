class NewsAndUpdatesController < ApplicationController
    before_action :set_news_and_update, only: [:show, :edit, :update, :destroy]
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
  
    def index
      news_and_updates = NewsAndUpdates.all
      render json: news_and_updates
    end
  
    def show
      render json: @news_and_update
    end
  
    def create
      @news_and_update = NewsAndUpdates.create(news_and_update_params)
    
      if @news_and_update.valid?
        render json: @news_and_update, status: :created
      else
        render json: { error: @news_and_update.errors.full_messages.join(', ') }, status: :unprocessable_entity
      end
    end
  
    def update
      if @news_and_update.update(news_and_update_params)
        render json:@news_and_update
      else
        render json: { errors: @news_and_update.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def destroy
      @news_and_update.destroy
      head :no_content
      render json: {}
    end
  
    private
  
    def set_news_and_update
      @news_and_update = NewsAndUpdates.find(params[:id])
    end
  
    def news_and_update_params
      params.require(:news_and_update).permit(:title, :content, :county_id, :user_id, :published_date)
    end
end
  
