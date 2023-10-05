class DiscussionReplySerializer < ActiveModel::Serializer
  attributes :id,:user_id,:content,:upvotes
end
