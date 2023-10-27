class AddTopicToDiscussions < ActiveRecord::Migration[7.0]
  def change
    add_column :discussions, :topic, :string
  end
end
