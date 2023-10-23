class NotificationsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound,with: :notification_not_found
    before_action :set_notification, only: [:update, :destroy]

    def index
        if @current_user
            notifications = Notification.where(user_to_id: @current_user.id).order(created_at: :desc).limit(20)
            render json: notifications
        else
            render json: {error: "You are not authenticated to perform this request"},status: :unauthorized
        end
        # notifications = Notification.all
        # render json: notifications, each_serializer: NotificationSerializer
    end

    def show
        notification = Notification.find(params[:id])
        render json: notification, serializer: NotificationSerializer
    end
    
    def update
        if @notification.update(status: "read")
            render json: {message: "deleted successfully"}
        else
            render json: @notification.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @notification.destroy
        head :no_content
    end

    private 

    def set_notification
        @notification = Notification.find(params[:id])
    end

    def notification_not_found
        render json: {error: "Notification not found"},status: :not_found
    end
end
