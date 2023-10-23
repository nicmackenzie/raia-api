class NotificationsController < ApplicationController
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
    
end
