class EventAttendeeSerializer < ActiveModel::Serializer
  attributes :id
  # def event_attendees
  #   object.event_attendees.map do |event_attendee|
  #     user = event_attendee.user
  #     {
  #       id: event_attendee.id,
  #       user: {
  #         id: user.id,
  #         full_name: user.full_name,
  #         username: user.username,
  #         profile_image: user.profile_image
  #       }
  #     }
  #   end
  # end
end
