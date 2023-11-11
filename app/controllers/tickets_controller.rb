class TicketsController < ApplicationController
    before_action :set_ticket, only: [:show, :edit, :update, :destroy]
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
  
    def index
      tickets = Ticket.all
      render json: tickets
    end
  
    def show
      render json: @ticket
    end
  
    def create
      @ticket = Ticket.create(ticket_params)
    
      if @ticket.valid?
        render json: @ticket, status: :created
      else
        render json: { error: @ticket.errors.full_messages.join(', ') }, status: :unprocessable_entity
      end
    end
  
    def update
      if @ticket.update(ticket_params)
        render json:@ticket
      else
        render json: { errors: @ticket.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def by_user
      user = User.find(params[:user])
      if user
        @tickets = Ticket.where(user_id: params[:user]).order(created_at: :desc)
        render json: @tickets
      else
        render json: {error: 'Trying to access an invalid ticket'}, status: :unprocessable_entity
      end
    end
  
    def destroy
      @ticket.destroy
      head :no_content
    end
  
    private
  
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    def not_found
      render json: {error: "Record not found"}
    end
  
    def ticket_params
      # params.require(:ticket).permit(:title, :description, :status, :user_id, :assigned_leader_id)
      params.permit(:title, :description,:category, :assigned_leader_id).merge(user_id: @current_user.id,status: 'pending')
    end
end
  