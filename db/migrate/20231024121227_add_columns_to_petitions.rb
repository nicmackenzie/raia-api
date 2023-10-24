class AddColumnsToPetitions < ActiveRecord::Migration[7.0]
  def change
    add_column :petitions, :petition_poster, :string
    add_column :petitions, :target_signature, :integer
    add_column :petitions, :topic, :string
  end
end
