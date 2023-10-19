class ReviewSerializer < ActiveModel::Serializer
  attributes :id,:content,:rating,:category,:created_at
  belongs_to :reviewer, serializer: ReviewUserSerializer
end
