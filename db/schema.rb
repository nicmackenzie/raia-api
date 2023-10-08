# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_10_08_060605) do
  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "full_name"
    t.string "national_id"
    t.string "gender"
    t.date "date_of_birth"
    t.string "occupation"
    t.string "interests"
    t.string "contact"
    t.string "location"
    t.integer "county_id"
    t.string "ward"
    t.integer "role"
    t.string "elected_position"
    t.string "profile_image"
    t.string "password_digest"
    t.boolean "verified"
    t.boolean "active"
    t.boolean "is_deleted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_uid"
  end

end
