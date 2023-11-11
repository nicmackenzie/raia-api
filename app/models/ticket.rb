class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :user_id, class_name: 'User', foreign_key: 'user_id'
  belongs_to :assigned_leader_id, class_name: 'User', foreign_key: 'assigned_leader_id'
  has_many :ticket_replies
  

  before_create :generate_ticket_number

  private

  def generate_ticket_number
    last_ticket = Ticket.order(:created_at).last
    last_number = last_ticket&.ticket_no || 100000
    self.ticket_no = last_number + 1
  end
end
