class CreateNewsAndUpdatesComments < ActiveRecord::Migration[7.0]
  def change
    create_table :news_and_updates_comments do |t|
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.references :news_and_updates, null: false, foreign_key: true

      t.timestamps
    end
  end
end
