class AddPriorityAndCategoryColumnsToTickets < ActiveRecord::Migration[7.0]
  def change
    add_column :tickets, :category, :string
    add_column :tickets, :priority, :string,default: 'medium'
  end
end
