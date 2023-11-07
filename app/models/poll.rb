class Poll < ApplicationRecord
    has_many :poll_options, dependent: :destroy
    has_many :poll_votes, dependent: :destroy
    belongs_to :user

    validates :question, presence: true
    validates :end_date, presence: true
    validate :date_must_be_greater_than_or_equal_to_today

  def date_must_be_greater_than_or_equal_to_today
    if end_date && end_date < Date.today
      errors.add(:end_date, "must be greater than or equal to today")
    end
  end

  def results
    poll_options
      .select('poll_options.*, COUNT(poll_votes.id) AS vote_count')
      .joins(:poll_votes)
      .group('poll_options.id')
  end
  
end
