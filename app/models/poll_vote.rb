class PollVote < ApplicationRecord
    belongs_to :poll
    belongs_to :user
    belongs_to :poll_option

    validates :poll_id,  presence: true
    validates :user_id,  presence: true
    validates :poll_option_id, presence: true
    validates :user_id, uniqueness: {scope: :poll_id,message: "Can only vote on a poll once"}
end
