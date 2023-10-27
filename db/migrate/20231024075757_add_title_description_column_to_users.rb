class AddTitleDescriptionColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :title_description, :string
  end
end
