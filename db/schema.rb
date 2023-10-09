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
  create_table "events", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.date "date"
    t.integer "county_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["county_id"], name: "index_events_on_county_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "news_and_updates", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.integer "county_id", null: false
    t.integer "user_id", null: false
    t.date "published_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["county_id"], name: "index_news_and_updates_on_county_id"
    t.index ["user_id"], name: "index_news_and_updates_on_user_id"
  end

  create_table "petitions", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_petitions_on_user_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "status"
    t.integer "user_id", null: false
    t.integer "assigned_leader_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assigned_leader_id"], name: "index_tickets_on_assigned_leader_id"
    t.index ["user_id"], name: "index_tickets_on_user_id"
  end

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

  add_foreign_key "events", "counties"
  add_foreign_key "events", "users"
  add_foreign_key "news_and_updates", "counties"
  add_foreign_key "news_and_updates", "users"
  add_foreign_key "petitions", "users"
  add_foreign_key "tickets", "users"
  add_foreign_key "tickets", "users", column: "assigned_leader_id"
end
