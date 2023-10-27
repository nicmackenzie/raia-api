class DiscussionSerializer < ActiveModel::Serializer
  attributes :id,:title,:content,:is_deleted, :created_at,:topic, :discussion_resources,:date
  belongs_to :user
  has_many :discussion_replies
end
