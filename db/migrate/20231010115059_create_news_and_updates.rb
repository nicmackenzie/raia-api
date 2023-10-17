class CreateNewsAndUpdates < ActiveRecord::Migration[7.0]
  def change
    create_table :news_and_updates do |t|
      t.string :title
      t.text :content
      t.references :county, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.date :published_date

      t.timestamps
    end
  end
end
