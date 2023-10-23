class EventsController < ApplicationController
    before_action :set_event, only: [:show, :edit, :update, :destroy,:enquire]
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    rescue_from ArgumentError, with: :argument_validate
    rescue_from ActiveRecord::RecordInvalid, with: :validate_unprocessable_entity
  
    def index
      events = Event.all
      render json: events
    end
  
    def show
      render json: @event
    end
  
    def create
      ActiveRecord::Base.transaction do
        @event = Event.create!(event_params)
        
        if @event.valid?
          @attendee = EventAttendee.create!(event_id: @event.id, user_id: @current_user.id)
          # setup background worker to handle code below
          county_users = User.where(county_id: @current_user.county_id,active: true,is_deleted: false)
          message = "#{@current_user.full_name} created a new event: #{@event.name}"
          redirect_url = "/events/#{@event.id}"

          county_users.each do |user|
            unless user.id = @current_user.id
              Notification.create(user_from_id: @current_user.id, user_to_id: user.id, message: message, notification_type: 'event', redirect_url: redirect_url)
            end
          end

          render json: @event, status: :created
        else
          render json: { error: @event.errors.full_messages.join(', ') }, status: :unprocessable_entity
        end
      end
    end
  
    def update
      if @event.update(event_params)
        render json:@event
      else
        render json: { errors: @event.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def by_range
      unless params[:start_date] && params[:end_date]
        return render json: {error: "Missing start or end date"}, status: :bad_request
      end

      start_date = Date.parse(params[:start_date])
      end_date = Date.parse(params[:end_date])

      if end_date < start_date
        render json: {error: 'End date must be later than the start date' }, status: :bad_request
      else
        events = Event.where(date: params[:start_date]..params[:end_date])
        render json: events
      end
    end

    def enquire
     if @event
      ActiveRecord::Base.transaction do
        enquiry = EventEnquiry.create!(enquiry_params)
        if enquiry
          Notification.create(notification_params)
          render json: {message: 'Enquiry has been submitted successfully'},status: :created
        else
          render json: {error: 'Unable to send enquiry' }, status: :internal_server_error
        end
      end
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

    def not_found
      render json: {error: "Event not found"}, status: :not_found
    end
  
    def event_params
      # params.require(:event).permit(:name, :description, :date, :county_id, :user_id)
      # event_datetime = DateTime.strptime(params[:time], "%I:%M%p")
      date = Date.strptime(params[:date], '%Y-%m-%d')
      time = DateTime.strptime(params[:time], '%I:%M%p')

      combined_datetime = DateTime.new(date.year, date.month, date.day, time.hour, time.min, 0)
      params.permit(:name, :description,:county_id, :user_id,:location,:poster_url).merge(date: combined_datetime)
    end

    def argument_validate
      render json: { error: 'Invalid date format' }, status: :bad_request
    end

    def validate_unprocessable_entity(invalid)
      render json: {errors: invalid.record.errors.full_messages},status: :unprocessable_entity
    end

    def enquiry_params
      params.permit(:user_id,:message).merge(event_id: params[:id])
    end

    def notification_params
      params.permit(:user_to_id).merge(message: 'You have received an enquiry on an event you created',user_from_id: params[:user_id])
    end
end
  