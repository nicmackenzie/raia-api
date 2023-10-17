class CreateDiscussionReplies < ActiveRecord::Migration[7.0]
  def change
    create_table :discussion_replies do |t|
      t.belongs_to :discussion, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true
      t.text :content
      t.integer :upvotes

      t.timestamps
    end
  end
end
