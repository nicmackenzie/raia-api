class SessionsController < ApplicationController
  def create
    
  end

  def destroy
    # session[:user_id] = nil
    render json: { message: 'Logged out successfully' }, status: :ok
  end
end
