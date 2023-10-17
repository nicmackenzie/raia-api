class UsersController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :validate_unprocessable_entity
  
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :check_role, only: [:edit, :update, :destroy]
  before_action :check_admin, only: [:index]
  before_action :check_parameter_existence, only: [:create, :update]
  before_action :authenticate_user, except: [:create]

  def index
    @users = User.all
    render json: @users
  end

  def top_influencers
    @top_users = User.top_influencers
    render json: @top_users
  end
  
  def find_by_username
    @user = User.find_by(username: params[:username])
    if @user
      render json: @user
    else
      render json: { error: 'User not found' }, status: :not_found
    end
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

   # This method will fetch and return leaders of the same county as the current user
   def leaders
    @leaders = User.where(role: 'leader', county_id: current_user.county_id)
    render json: @leaders
  end
  

def follow
  user_to_follow = User.find(params[:id])
  unless current_user.following.include?(user_to_follow)
    current_user.following << user_to_follow
    render json: { message: "Now following #{user_to_follow.full_name}" }
  else
    render json: { error: "You are already following #{user_to_follow.full_name}" }, status: :unprocessable_entity
  end
end

# Allows a user to unfollow another user
def unfollow
  user_to_unfollow = User.find(params[:id])
  if current_user.following.include?(user_to_unfollow)
    current_user.following.delete(user_to_unfollow)
    render json: { message: "Unfollowed #{user_to_unfollow.full_name}" }
  else
    render json: { error: "You are not following #{user_to_unfollow.full_name}" }, status: :unprocessable_entity
  end
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
    params.require(:user).permit(:username, :email, :full_name, :national_id, :gender, :date_of_birth, :occupation, :interests, :contact, :location, :county_id, :ward, :role, :elected_position, :profile_image, :verified, :active, :is_deleted, :user_uid)
  end

  def check_parameter_existence
    unless params.key?(:user)
      render json: { error: 'Missing parameters' }, status: :bad_request
    end
  end

  def validate_unprocessable_entity(invalid)
    render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
  end
end
