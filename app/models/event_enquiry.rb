class EventEnquiry < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :event_id,presence: true
  validates :user_id,presence: true
  validates :message, {presence: true, length: { minimum:20 }}
end
