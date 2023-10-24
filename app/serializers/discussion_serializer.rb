class DiscussionSerializer < ActiveModel::Serializer
  attributes :id,:title,:content,:is_deleted, :created_at
  belongs_to :user
  has_many :discussion_replies
end
