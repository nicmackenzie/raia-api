class AddTitleColumnToUserTitles < ActiveRecord::Migration[7.0]
  def change
    add_column :user_titles, :title, :string
  end
end
