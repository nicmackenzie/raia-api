class PetitionSignaturesController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :validate_unprocessable_entity

  def create
    @signed = PetitionSignature.create!(signature_params)
    
    if @signed.valid?
      render json: {message: 'Thanks for your support'}
    end

  end

  private

  def signature_params
    params.permit(:reason_for_signing).merge(petition_id: params[:id],user_id: @current_user.id)
  end

  def validate_unprocessable_entity(invalid)
    render json: {errors: invalid.record.errors.full_messages},status: :unprocessable_entity
  end 
end
