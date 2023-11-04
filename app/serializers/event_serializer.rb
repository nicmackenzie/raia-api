class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :date, :county_id, :location, :poster_url, :user, :event_attendees

  # belongs_to :user,serializer: ReviewUserSerializer
  # has_many :event_attendees
  def user
    user = object.user
    {
      id: user.id,
      username: user.username,
      full_name: user.full_name,
      profile_image: user.profile_image
    }
  end

  def event_attendees
    object.event_attendees.map do |event_attendee|
      user = event_attendee.user
      {
        id: event_attendee.id,
        user: {
          id: user.id,
          full_name: user.full_name,
          username: user.username,
          profile_image: user.profile_image
        }
      }
    end
  end
end

