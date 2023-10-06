class PetitionsController < ApplicationController
    before_action :set_petition, only: [:show, :edit, :update, :destroy]
  
    def index
      @petitions = Petition.all
    end
  
    def show
    end
  
    def new
      @petition = Petition.new
    end
  
    def create
      @petition = Petition.new(petition_params)
      if @petition.save
        redirect_to @petition, notice: 'Petition was successfully created.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @petition.update(petition_params)
        redirect_to @petition, notice: 'Petition was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @petition.destroy
      redirect_to petitions_url, notice: 'Petition was successfully destroyed.'
    end
  
    private
  
    def set_petition
      @petition = Petition.find(params[:id])
    end
  
    def petition_params
      params.require(:petition).permit(:title, :description, :user_id)
    end
end
  