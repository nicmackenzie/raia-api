class DiscussionPoll < ApplicationRecord
  belongs_to :user
  belongs_to :discussion
  validates_numericality_of :votes
  validates_presence_of :user_id,:discussion_id
end
