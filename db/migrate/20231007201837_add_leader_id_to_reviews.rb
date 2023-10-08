class AddLeaderIdToReviews < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :leader_id, :integer
  end
end
