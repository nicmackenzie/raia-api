class AddTicketNoToTickets < ActiveRecord::Migration[7.0]
  def change
    add_column :tickets, :ticket_no, :string
  end
end
