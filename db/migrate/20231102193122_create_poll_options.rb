class CreatePollOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :poll_options do |t|
      t.references :poll, null: false,foreign_key: true
      t.string :option
    end
  end
end
