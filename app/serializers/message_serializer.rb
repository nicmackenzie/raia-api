class MessageSerializer < ActiveModel::Serializer
  attributes :id,:sender_id,:content,:created_at
end
