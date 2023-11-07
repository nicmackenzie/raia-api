class CreatePolls < ActiveRecord::Migration[7.0]
  def change
    create_table :polls do |t|
      t.string :question
      t.datetime :end_date
      t.references :user, null: false, foreign_key: true
      t.datetime :created_at, default: -> { 'CURRENT_TIMESTAMP' }
    end
  end
end
