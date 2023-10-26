class PetitionsController < ApplicationController
    before_action :set_petition, only: [:show, :edit, :update, :destroy]
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    # skip_before_action :authenticate_user
  
    def index
      petitions = Petition.all
      render json: petitions,each_serializer: PetitionSerializer
    end
  
    def show
      render json: @petition
    end
  
    def create
      @petition = Petition.create(petition_params)
    
      if @petition.valid?
        render json: @petition, status: :created
      else
        render json: { error: @petition.errors.full_messages.join(', ') }, status: :unprocessable_entity
      end
    end
  
    def update
      if @petition.update(petition_params)
        render json: @petition
      else
        render json: { errors: @petition.errors.full_messages }, status: :unprocessable_entity
      end
   end
  
    def destroy
      @petition.destroy
      head :no_content
    end
  
    private

    def not_found
      render json: {error: "Record not found"}
    end
  
    def set_petition
      @petition = Petition.find(params[:id])
    end
  
    def petition_params
      params.permit(:title, :description, :petition_poster,:target_signature,:topic).merge(user_id: @current_user.id)
    end
end
  