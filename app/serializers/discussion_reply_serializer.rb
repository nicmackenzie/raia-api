class DiscussionReplySerializer < ActiveModel::Serializer
  attributes :id,:content,:upvotes
  belongs_to :user
end
