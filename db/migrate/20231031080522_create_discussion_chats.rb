class CreateDiscussionChats < ActiveRecord::Migration[7.0]
  def change
    create_table :discussion_chats do |t|
      t.references :discussion, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :message
      t.datetime :created_at, default: -> { 'CURRENT_TIMESTAMP' }
    end
  end
end
