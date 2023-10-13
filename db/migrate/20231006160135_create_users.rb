class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :full_name
      t.string :national_id
      t.string :gender
      t.date :date_of_birth
      t.string :occupation
      t.string :interests
      t.string :contact
      t.string :location
      t.integer :county_id
      t.string :ward
      t.integer :role
      t.string :elected_position
      t.string :profile_image
      t.string :password_digest
      t.boolean :verified
      t.boolean :active
      t.boolean :is_deleted

      t.timestamps
    end
  end
end
