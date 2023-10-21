class Event < ApplicationRecord
  belongs_to :county
  belongs_to :user
  has_many :event_attendees
end
