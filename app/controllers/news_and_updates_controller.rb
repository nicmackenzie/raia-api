class NewsAndUpdatesController < ApplicationController
    before_action :set_news_and_update, only: [:show, :edit, :update, :destroy]
  
    def index
      @news_and_updates = NewsAndUpdates.all
    end
  
    def show
    end
  
    def new
      @news_and_update = NewsAndUpdates.new
    end
  
    def create
      @news_and_update = NewsAndUpdates.new(news_and_update_params)
      if @news_and_update.save
        redirect_to @news_and_update, notice: 'News and Update was successfully created.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @news_and_update.update(news_and_update_params)
        redirect_to @news_and_update, notice: 'News and Update was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @news_and_update.destroy
      redirect_to news_and_updates_url, notice: 'News and Update was successfully destroyed.'
    end
  
    private
  
    def set_news_and_update
      @news_and_update = NewsAndUpdates.find(params[:id])
    end
  
    def news_and_update_params
      params.require(:news_and_update).permit(:title, :content, :county_id, :user_id, :published_date)
    end
end
  
