class DiscussionReply < ApplicationRecord
  belongs_to :discussion
  belongs_to :user
  validates :content, presence: true

  # after_create_commit {broadcast_reply}

  # private

  # def broadcast_reply
  #   ActionCable.server.broadcast('DiscussionReplyChannel', self)
  # end
end
