class MessagesController < ApplicationController
    # before_action :set_message, only: [:show, :destroy]
    
    # Rescue from common errors and handle them
    rescue_from ActiveRecord::RecordInvalid, with: :render_record_invalid
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  
    # Index action to list all messages
    def index
      messages = Message.all
      render json: messages, status: :ok
    end
    
    def mySentMessages
      user_id = params[:user_id]
      messages = Message.where(sender_id: user_id)
      render json: messages, status: :ok
    end
  
    def myReceivedMessages
      user_id = params[:user_id]
      messages = Message.where(receiver_id: user_id)
      render json: messages, status: :ok
    end

    # Show a specific message
    def show
      render json: @message, status: :ok
    end
  
    # Create a new message
    def create
        # sender should be the current user
        # sender = User.find_by(username: message_params[:sender])
        receiver = User.find_by(email: message_params[:receiver])
        
        if receiver
          @message = Message.new(sender_id: message_params[:sender_id], receiver_id: receiver.id, content: message_params[:content])
          
          if @message.save
            render json: @message, status: :created
          else
            render json: @message.errors, status: :unprocessable_entity
          end
        else
          render json: { error: "Invalid receiver" }, status: :bad_request
        end
    end
      
  
    # Destroy a specific message
    def destroy
      @message.destroy
      head :no_content
    end
  
    private
    
    # Use strong parameters to allow specific data through
    def message_params
        params.permit(:sender_id, :receiver, :content)
    end

    # Handle RecordInvalid errors
    def render_record_invalid(exception)
      render json: {errors: exception.record.errors.full_messages}, status: :unprocessable_entity
    end
  
    # Handle RecordNotFound errors
    def render_not_found
      render json: {error: "Message not found"}, status: :not_found
    end
    
    # Find a specific message and set it for use in other actions
    def set_message
      @message = Message.find(params[:id])
    end
  end
  