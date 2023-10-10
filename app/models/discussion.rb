class Discussion < ApplicationRecord
  has_many :discussion_replies
  belongs_to :user
  validates :title, presence: true
  validates :title, uniqueness: true
end
