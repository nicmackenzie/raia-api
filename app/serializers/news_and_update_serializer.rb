class NewsAndUpdateSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :county_id, :user_id, :published_date
end

