class CreateTicketReplies < ActiveRecord::Migration[7.0]
  def change
    create_table :ticket_replies do |t|
      t.references :ticket, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :comment, null: false
      t.datetime :created_at, default: -> { 'CURRENT_TIMESTAMP' }
    end
  end
end
