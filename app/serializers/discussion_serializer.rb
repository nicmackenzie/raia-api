class DiscussionSerializer < ActiveModel::Serializer
  attributes :id,:title,:content,:is_deleted
  belongs_to :user
  has_many :discussion_replies
end
