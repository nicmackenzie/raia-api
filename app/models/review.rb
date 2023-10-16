class Review < ApplicationRecord
  belongs_to :leader,class_name: 'User',foreign_key: 'leader_id'
  belongs_to :reviewer,class_name: 'User',foreign_key: 'reviewer_id'

  validates :content,:rating,:category,:reviewer_id,:leader_id,presence: true
  validate :reviewer_and_leader_not_same
  def reviewer_and_leader_not_same
    if reviewer_id == leader_id
      error.add(:base,"Reviewer and leader cannot be the same")
    end
  end
end
