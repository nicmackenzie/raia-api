class CreateEventDetails < ActiveRecord::Migration[7.0]
    def change
      create_table :event_details do |t|
        t.belongs_to :user, null: false, foreign_key: true
        t.belongs_to :event, null: false, foreign_key: true
        t.text :inquiry
        t.string :inquiry_reply
        t.boolean :is_attending
  
        t.timestamps
      end
    end
  end