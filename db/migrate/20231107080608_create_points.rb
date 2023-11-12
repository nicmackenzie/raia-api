class CreatePoints < ActiveRecord::Migration[7.0]
  def change
    create_table :points do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :points
      t.string :point_type
      t.string :description
      t.datetime :created_at, default: -> { 'CURRENT_TIMESTAMP' }
    end
  end
end
