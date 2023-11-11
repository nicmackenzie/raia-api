class TicketSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :status, :assigned_leader_id, :ticket_no,:category, :created_at
  belongs_to :assigned_leader_id, serializer: ReviewUserSerializer
end
