class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: [:create,:set_uid]

  def create
    user = User.find_by(email: params[:email]) 

    if user && user.authenticate(params[:password])
      # Generate a JWT token
      token = generate_jwt_token(user)

      render json: { token: token, user_id: user.id }
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  # get currently logged user
  def me
    render json: @current_user,except: [:password_digest,:created_at,:updated_at]
  end

  def set_uid
    user = User.find(params[:id])
    if user
      user.update(user_uid: params[:user_uid])
      render json: {message: "successfully signed up"}
    else
      render json: {error: 'Unable to complete request'},status: :not_found
    end
  end

  def destroy
    render json: { message: 'Logged out successfully' }, status: :ok
  end

  private

  def generate_jwt_token(user)
    payload = { sub: user.id, exp: 24.hours.from_now.to_i }
    JWT.encode(payload, ENV['JWT_SECRET'], 'HS256')
  end
end

