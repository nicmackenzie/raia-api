class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :date, :county_id, :location, :poster_url

  belongs_to :user,serializer: ReviewUserSerializer
end
