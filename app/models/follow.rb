class Follow < ApplicationRecord
  belongs_to :follower, class_name: 'User'
  belongs_to :followed, class_name: 'User'

  # Ensure a user can't follow another user more than once
  validates :follower_id, uniqueness: { scope: :followed_id }
end
