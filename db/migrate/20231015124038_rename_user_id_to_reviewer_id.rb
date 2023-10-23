class RenameUserIdToReviewerId < ActiveRecord::Migration[7.0]
  def change
    rename_column :reviews,:user_id,:reviewer_id
  end
end
