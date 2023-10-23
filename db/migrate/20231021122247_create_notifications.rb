class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.references :user_from, foreign_key: { to_table: :users }
      t.references :user_to, null: false, foreign_key: { to_table: :users }
      t.string :message
      t.string :status, default: 'unread]'
      t.datetime :created_at, default: -> { 'CURRENT_TIMESTAMP' }
    end
  end
end
