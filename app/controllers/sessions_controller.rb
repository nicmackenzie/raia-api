class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: [:create]

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

  def destroy
    # session[:user_id] = nil
    render json: { message: 'Logged out successfully' }, status: :ok
  end

  private

  def generate_jwt_token(user)
    # Implement your JWT token generation logic here
    payload = { sub: user.id, exp: 24.hours.from_now.to_i }
    JWT.encode(payload, ENV['JWT_SECRET'], 'HS256')
  end
end

