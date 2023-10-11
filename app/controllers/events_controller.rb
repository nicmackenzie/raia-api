class EventsController < ApplicationController
    before_action :set_event, only: [:show, :edit, :update, :destroy]
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
  
    def index
      events = Event.all
      render json: events
    end
  
    def show
      render json: @event
    end
  
    def create
      @event = Event.create(event_params)
    
      if @event.valid?
        render json: @event, status: :created
      else
        render json: { error: @event.errors.full_messages.join(', ') }, status: :unprocessable_entity
      end
    end
  
    def update
      if @event.update(event_params)
        render json:@event
      else
        render json: { errors: @event.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def destroy
      @event.destroy
      head :no_content
      render json: {}
    end
  
    private
  
    def set_event
      @event = Event.find(params[:id])
    end
  
    def event_params
      params.require(:event).permit(:name, :description, :date, :county_id, :user_id)
    end
end
  