class ResetStatusValueForNotifications < ActiveRecord::Migration[7.0]
  def change
    change_column :notifications,:status,:string, default: "unread"
  end
end
