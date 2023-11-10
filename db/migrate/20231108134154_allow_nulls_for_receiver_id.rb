class AllowNullsForReceiverId < ActiveRecord::Migration[7.0]
  def change
    change_column :messages, :receiver_id, :integer, null: true
  end
end
