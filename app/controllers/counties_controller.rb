class CountiesController < ApplicationController
    before_action :set_county, only: [:show, :edit, :update, :destroy]
  
    def index
      @counties = County.all
      render json: @counties
    end
  
    def show
      render json: @county
    end
  
    def create
      @county = County.new(county_params)
      if @county.save
        render json: @county, status: :created
      else
        render json: @county.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @county.update(county_params)
        render json: @county, status: :ok
      else
        render json: @county.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @county.destroy
      head :no_content
    end
  
    private
  
    def set_county
      @county = County.find(params[:id])
    end
  
    def county_params
      params.require(:county).permit(:name)
    end
  end
  