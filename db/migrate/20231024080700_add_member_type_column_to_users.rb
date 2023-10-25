class AddMemberTypeColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :member_type, :string
  end
end
