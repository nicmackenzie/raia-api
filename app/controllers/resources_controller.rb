class ResourcesController < ApplicationController
  skip_before_action :authenticate_user, except: [:destroy]
    before_action :set_resource, only: [:show, :update, :destroy]
  
    # GET /resources
    def index
      @resources = Resource.all
      render json: @resources
    end
  
    # GET /resources/1
    def show
      render json: @resource
    end
  
    # POST /resources
    def create
      @resource = Resource.new(resource_params)
  
      if @resource.save
        render json: @resource, status: :created
      else
        render json: @resource.errors, status: :unprocessable_entity
      end
    end
  
    # PUT /resources/1
    def update
      if @resource.update(resource_params)
        render json: @resource
      else
        render json: @resource.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /resources/1
    def destroy
      @resource.destroy
      head :no_content
    end
  
    private
  
    def set_resource
      @resource = Resource.find(params[:id])
    end
  
    def resource_params
      params.require(:resource).permit(:title, :description, :image)
    end
end
  