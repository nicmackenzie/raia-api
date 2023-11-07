class PollOption < ApplicationRecord
    belongs_to :poll
    has_many :poll_votes

    validates :option, presence: true
end
