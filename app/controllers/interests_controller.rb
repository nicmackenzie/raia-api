class InterestsController < ApplicationController
    before_action :set_interest, only: [:show, :edit, :update, :destroy]
  
    def index
      @interests = Interest.all
      render json: @interests
    end
  
    def show
      render json: @interest
    end
  
    def create
      @interest = Interest.new(interest_params)
      if @interest.save
        render json: @interest, status: :created
      else
        render json: @interest.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @interest.update(interest_params)
        render json: @interest, status: :ok
      else
        render json: @interest.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @interest.destroy
      head :no_content
    end
  
    private
  
    def set_interest
      @interest = Interest.find(params[:id])
    end
  
    def interest_params
      params.require(:interest).permit(:name, :user_id)
    end
  end
  