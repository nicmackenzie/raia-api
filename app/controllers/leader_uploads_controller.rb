class LeaderUploadsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :validate_unprocessable_entity

  def create
    ActiveRecord::Base.transaction do
      upload = LeaderUpload.create(upload_params)
      @user = User.find(@current_user.id)
      @user.update(user_params)
    end
    render json: {success: true, message:"Successfully uploaded"},status: :created
  end

  private 

  def upload_params
    params.permit(:upload_url).merge(user_id: @current_user.id)
  end

  def user_params
    params.permit(:county_id,:elected_position)
  end

  def validate_unprocessable_entity(invalid)
    render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
  end
end
