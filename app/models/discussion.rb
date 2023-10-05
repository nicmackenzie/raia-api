class Discussion < ApplicationRecord
  has_many discussion_replies
  belongs_to :user
end
