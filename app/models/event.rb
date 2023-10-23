class Event < ApplicationRecord
  belongs_to :county
  belongs_to :user
  has_many :event_attendees, dependent: :destroy
  has_many :event_enquiries, dependent: :destroy
end
