class AddImageToNewsAndUpdates < ActiveRecord::Migration[7.0]
  def change
    add_column :news_and_updates, :image, :string
  end
end
