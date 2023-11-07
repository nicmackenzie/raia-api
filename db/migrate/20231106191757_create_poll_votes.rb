class CreatePollVotes < ActiveRecord::Migration[7.0]
  def change
    create_table :poll_votes do |t|
      t.references :poll, null: false, foreign_key:true
      t.references :user, null: false, foreign_key:true
      t.references :poll_option, null:false, foreign_key:true
      t.datetime :created_at, default: -> { 'CURRENT_TIMESTAMP' }
    end
  end
end
