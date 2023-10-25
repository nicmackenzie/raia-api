class CreatePetitionSignatures < ActiveRecord::Migration[7.0]
  def change
    create_table :petition_signatures do |t|
      t.references :petition, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :reason_for_signing

      t.timestamps
    end
  end
end
