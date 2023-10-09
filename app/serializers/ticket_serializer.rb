class TicketSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :status, :user_id, :assigned_leader_id
end
