class Review < ApplicationRecord
  belongs_to :user
  validates :content,:rating,:category,:reviewer_id,:leader_id,presence: true
  validate :reviewer_and_leader_not_same
  def reviewer_and_leader_not_same
    if reviewer_id == leader_id
      error.add(:base,"Reviewer and leader cannot be the same")
    end
  end
end
