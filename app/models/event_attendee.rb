class EventAttendee < ApplicationRecord
    belongs_to :user
    belongs_to :event

    validates :user_id, presence: true
    validates :event_id, presence: true
    validates :user_id, uniqueness: { scope: :event_id, message: 'Can only attend a event once' }
end
