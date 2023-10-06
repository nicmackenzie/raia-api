class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    before_action :check_role, only: [:edit, :update, :destroy]
  
    def index
      @users = User.all
      render json: @users
    end
  
    def show
      render json: @user
    end
  
    def create
      @user = User.new(user_params)
      if @user.save
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
  
    def user_params
      params.require(:user).permit(:email, :full_name, :national_id, :gender, :date_of_birth, :occupation, :interests, :contact, :location, :county_id, :ward, :role, :elected_position, :profile_image, :verified, :active, :is_deleted)
    end
end