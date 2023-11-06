class DiscussionPoll < ApplicationRecord
  belongs_to :user
  belongs_to :discussion
  validates_numericality_of :votes
end
