class TicketReply < ApplicationRecord
    belongs_to :ticket

    validates :ticket_id,:user_id,:comment, presence: true
end
