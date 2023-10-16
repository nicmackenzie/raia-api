class CreateNewsAndUpdateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :news_and_update_comments do |t|
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.references :news_and_update, null: false, foreign_key: true

      t.timestamps
    end
  end
end
