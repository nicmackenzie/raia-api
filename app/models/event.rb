class Event < ApplicationRecord
  belongs_to :county
  has_many :event_details
  has_many :users,through: :event_details
  
end
