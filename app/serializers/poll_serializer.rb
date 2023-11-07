class PollSerializer < ActiveModel::Serializer
  attributes :id, :question,:count,:user,:end_date,:options,:results, :created_at
  belongs_to :user,serializer: ReviewUserSerializer
  has_many :voters, serializer: ReviewUserSerializer

  def count
    object.poll_votes.count
  end

  def options
    object.poll_options.map do |option|
      {id: option.id,option: option.option}
    end
  end

  def voters
    object.poll_votes.includes(:user).map { |vote| vote.user }
  end
end
