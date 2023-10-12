class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :date, :county_id, :user_id
end
