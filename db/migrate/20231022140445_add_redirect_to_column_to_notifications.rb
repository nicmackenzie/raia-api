class AddRedirectToColumnToNotifications < ActiveRecord::Migration[7.0]
  def change
    add_column :notifications, :redirect_url, :string
  end
end
