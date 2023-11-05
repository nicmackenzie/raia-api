class CreateDiscussionPolls < ActiveRecord::Migration[7.0]
  def change
    create_table :discussion_polls do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :discussion, null: false, foreign_key: true
      t.integer :votes
      t.string :title

      t.timestamps
    end
  end
end
