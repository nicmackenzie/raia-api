class CreateLeaderUploads < ActiveRecord::Migration[7.0]
  def change
    create_table :leader_uploads do |t|
      t.references :user, foreign_key: true
      t.string :upload_url
      t.timestamp :created_at, default: -> { 'CURRENT_TIMESTAMP' }, null: false
    end
  end
end
