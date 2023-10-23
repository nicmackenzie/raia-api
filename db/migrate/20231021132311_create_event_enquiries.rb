class CreateEventEnquiries < ActiveRecord::Migration[7.0]
  def change
    create_table :event_enquiries do |t|
      t.text :message
      t.references :user, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true
      t.datetime :created_at, default: -> { 'CURRENT_TIMESTAMP' }
      
    end
  end
end
