class DefaultValueForActive < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :active,:boolean, default: true
  end
end
