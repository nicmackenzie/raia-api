class ApplicationController < ActionController::API
    # before_action :authenticate_user
    # # get token from the Authorization section of the headers
    # token = request.headers['Authorization']&.split(' ')&.last
    # if token
    #     begin
    #       decoded_token = JWT.decode(token, ENV['JWT_SECRET'], true, algorithm: 'HS256')
    #       user = User.find(decoded_token[0]['sub'])
    #       session[:user_id] = user.id
    #     rescue JWT::ExpiredSignature
    #       render json: { error: 'Token has expired' }, status: :unauthorized
    #     rescue JWT::DecodeError
    #       render json: { error: 'Invalid token' }, status: :unauthorized
    #     end
    # else
    #     render json: { error: 'Token missing' }, status: :unauthorized
    # end
end
