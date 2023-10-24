class CreateUserTitles < ActiveRecord::Migration[7.0]
  def change
    create_table :user_titles do |t|
      t.references :user, null: false, foreign_key: true
      t.datetime :created_at, default: -> { 'CURRENT_TIMESTAMP' }
    end
  end
end
