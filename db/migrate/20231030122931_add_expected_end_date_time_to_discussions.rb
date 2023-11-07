class AddExpectedEndDateTimeToDiscussions < ActiveRecord::Migration[7.0]
  def change
    add_column :discussions, :end_datetime, :datetime
  end
end
