class AddUserUidToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :user_uid, :string
  end
end
