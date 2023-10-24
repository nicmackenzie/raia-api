class ReviewUserSerializer < ActiveModel::Serializer
  attributes :id, :username, :full_name, :profile_image
end
