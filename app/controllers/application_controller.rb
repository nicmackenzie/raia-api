class ApplicationController < ActionController::API
  rescue_from StandardError, with: :handle_uncaught_error
  before_action :authenticate_user


  def route_not_found
    render json: {error: 'Invalid route!'}, status: :not_found
  end
  
  private

  def authenticate_user
    token = request.headers['Authorization']&.split(' ')&.last

    if token
      begin
        decoded_token = JWT.decode(token, ENV['JWT_SECRET'], true, algorithm: 'HS256')
      
        user = User.find_by(user_uid: decoded_token[0]['sub'])
        @current_user = user
      rescue JWT::ExpiredSignature
        render json: { error: 'Token has expired' }, status: :unauthorized
      rescue JWT::DecodeError
        render json: { error: 'Invalid token' }, status: :unauthorized
      end
    else
      render json: { error: 'Token missing' }, status: :unauthorized
    end
  end

  def handle_uncaught_error(exception)
    Rails.logger.error(exception)
    render json: { error: exception.message }, status: :internal_server_error
  end
end
