class UsersController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :validate_unprocessable_entity
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    before_action :check_role, only: [:edit, :update, :destroy]
    before_action :check_admin, only: [:index]
    before_action :check_parameter_existence, only: [:create,:update]
    
    def index
      @users = User.all
      render json: @users
    end
  
    def show
      render json: @user
    end
  
    def create
      @user = User.new(user_params)
      if @user.save!
        render json: @user, status: :created
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @user.update(user_params)
        render json: @user, status: :ok
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @user.destroy
      head :no_content
    end
  
    private
  
    def set_user
      @user = User.find(params[:id])
    end
  
    def check_role
      unless current_user&.admin? || current_user == @user
        render json: { error: "You don't have the necessary permissions to perform this action." }, status: :forbidden
      end
    end

    def check_admin
      unless current_user&.admin?
        render json: { error: "You don't have the necessary permissions to access this page." }, status: :forbidden
      end
    end
  
    def user_params
      params.require(:user).permit(:email, :full_name, :national_id, :gender, :date_of_birth, :occupation, :interests, :contact, :location, :county_id, :ward, :role, :elected_position, :profile_image, :verified, :active, :is_deleted,:user_uid)
    end

    # confirm if the :user parameter is passed before create and update. 
    # method added to counter the ActionController::ParameterMissing: param exception that would occur if request if made without data
    def check_parameter_existence
      unless params.key?(:user)
        render json: { error: 'Missing parameters' }, status: :bad_request
      end
    end

    def validate_unprocessable_entity(invalid)
      render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
end