class Review < ApplicationRecord
  belongs_to :leader,class_name: 'User',foreign_key: 'leader_id'
  belongs_to :reviewer,class_name: 'User',foreign_key: 'reviewer_id'
 validates :content,:category,:reviewer_id,:leader_id,:rating,presence: true
end
