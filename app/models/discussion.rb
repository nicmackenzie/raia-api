class Discussion < ApplicationRecord
  has_many :discussion_replies
  has_many :discussion_chats
  belongs_to :user
  validates :title, presence: true
  validates :title, uniqueness: true
end
