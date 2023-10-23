class AddColumnNameToDiscussions < ActiveRecord::Migration[7.0]
  def change
    add_column :discussions, :discussion_resources, :string
  end
end
