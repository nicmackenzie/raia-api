class AddNewColumnToReviews < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :leader_id, :integer
    add_column :reviews, :category, :string
  end
end
