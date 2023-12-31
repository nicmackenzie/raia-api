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

ActiveRecord::Schema[7.0].define(version: 2023_11_07_091811) do
  create_table "counties", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "discussion_chats", force: :cascade do |t|
    t.integer "discussion_id", null: false
    t.integer "user_id", null: false
    t.text "message"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }
    t.index ["discussion_id"], name: "index_discussion_chats_on_discussion_id"
    t.index ["user_id"], name: "index_discussion_chats_on_user_id"
  end

  create_table "discussion_replies", force: :cascade do |t|
    t.integer "discussion_id", null: false
    t.integer "user_id", null: false
    t.text "content"
    t.integer "upvotes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discussion_id"], name: "index_discussion_replies_on_discussion_id"
    t.index ["user_id"], name: "index_discussion_replies_on_user_id"
  end

  create_table "discussions", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.integer "user_id", null: false
    t.boolean "is_deleted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "discussion_resources"
    t.datetime "date"
    t.string "topic"
    t.datetime "end_datetime"
    t.index ["user_id"], name: "index_discussions_on_user_id"
  end

  create_table "event_attendees", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "event_id", null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }
    t.index ["event_id"], name: "index_event_attendees_on_event_id"
    t.index ["user_id"], name: "index_event_attendees_on_user_id"
  end

  create_table "event_enquiries", force: :cascade do |t|
    t.text "message"
    t.integer "user_id", null: false
    t.integer "event_id", null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }
    t.index ["event_id"], name: "index_event_enquiries_on_event_id"
    t.index ["user_id"], name: "index_event_enquiries_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "date"
    t.integer "county_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "location"
    t.string "poster_url"
    t.index ["county_id"], name: "index_events_on_county_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "follows", force: :cascade do |t|
    t.integer "follower_id", null: false
    t.integer "followed_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followed_id"], name: "index_follows_on_followed_id"
    t.index ["follower_id"], name: "index_follows_on_follower_id"
  end

  create_table "interests", force: :cascade do |t|
    t.string "name"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_interests_on_user_id"
  end

  create_table "leader_uploads", force: :cascade do |t|
    t.integer "user_id"
    t.string "upload_url"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["user_id"], name: "index_leader_uploads_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.integer "sender_id", null: false
    t.integer "receiver_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "news_and_update_comments", force: :cascade do |t|
    t.text "content"
    t.integer "user_id", null: false
    t.integer "news_and_update_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["news_and_update_id"], name: "index_news_and_update_comments_on_news_and_update_id"
    t.index ["user_id"], name: "index_news_and_update_comments_on_user_id"
  end

  create_table "news_and_updates", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.integer "county_id", null: false
    t.integer "user_id", null: false
    t.date "published_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.index ["county_id"], name: "index_news_and_updates_on_county_id"
    t.index ["user_id"], name: "index_news_and_updates_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "user_from_id"
    t.integer "user_to_id", null: false
    t.string "message"
    t.string "status", default: "unread"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }
    t.string "redirect_url"
    t.string "notification_type"
    t.index ["user_from_id"], name: "index_notifications_on_user_from_id"
    t.index ["user_to_id"], name: "index_notifications_on_user_to_id"
  end

  create_table "petition_signatures", force: :cascade do |t|
    t.integer "petition_id", null: false
    t.integer "user_id", null: false
    t.text "reason_for_signing"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["petition_id"], name: "index_petition_signatures_on_petition_id"
    t.index ["user_id"], name: "index_petition_signatures_on_user_id"
  end

  create_table "petitions", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "petition_poster"
    t.integer "target_signature"
    t.string "topic"
    t.index ["user_id"], name: "index_petitions_on_user_id"
  end

  create_table "points", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "points"
    t.string "point_type"
    t.string "description"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }
    t.index ["user_id"], name: "index_points_on_user_id"
  end

  create_table "poll_options", force: :cascade do |t|
    t.integer "poll_id", null: false
    t.string "option"
    t.index ["poll_id"], name: "index_poll_options_on_poll_id"
  end

  create_table "poll_votes", force: :cascade do |t|
    t.integer "poll_id", null: false
    t.integer "user_id", null: false
    t.integer "poll_option_id", null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }
    t.index ["poll_id"], name: "index_poll_votes_on_poll_id"
    t.index ["poll_option_id"], name: "index_poll_votes_on_poll_option_id"
    t.index ["user_id"], name: "index_poll_votes_on_user_id"
  end

  create_table "polls", force: :cascade do |t|
    t.string "question"
    t.datetime "end_date"
    t.integer "user_id", null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }
    t.index ["user_id"], name: "index_polls_on_user_id"
  end

  create_table "resources", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.text "content"
    t.decimal "rating"
    t.integer "reviewer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "leader_id"
    t.string "category"
    t.index ["reviewer_id"], name: "index_reviews_on_reviewer_id"
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

  create_table "user_titles", force: :cascade do |t|
    t.integer "user_id", null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }
    t.string "title"
    t.index ["user_id"], name: "index_user_titles_on_user_id"
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
    t.boolean "active", default: true
    t.boolean "is_deleted", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_uid"
    t.string "username"
    t.string "title_description"
    t.string "member_type"
  end

  add_foreign_key "discussion_chats", "discussions"
  add_foreign_key "discussion_chats", "users"
  add_foreign_key "discussion_replies", "discussions"
  add_foreign_key "discussion_replies", "users"
  add_foreign_key "discussions", "users"
  add_foreign_key "event_attendees", "events"
  add_foreign_key "event_attendees", "users"
  add_foreign_key "event_enquiries", "events"
  add_foreign_key "event_enquiries", "users"
  add_foreign_key "events", "counties"
  add_foreign_key "events", "users"
  add_foreign_key "follows", "followeds"
  add_foreign_key "follows", "followers"
  add_foreign_key "interests", "users"
  add_foreign_key "leader_uploads", "users"
  add_foreign_key "news_and_update_comments", "news_and_updates"
  add_foreign_key "news_and_update_comments", "users"
  add_foreign_key "news_and_updates", "counties"
  add_foreign_key "news_and_updates", "users"
  add_foreign_key "notifications", "users", column: "user_from_id"
  add_foreign_key "notifications", "users", column: "user_to_id"
  add_foreign_key "petition_signatures", "petitions"
  add_foreign_key "petition_signatures", "users"
  add_foreign_key "petitions", "users"
  add_foreign_key "points", "users"
  add_foreign_key "poll_options", "polls"
  add_foreign_key "poll_votes", "poll_options"
  add_foreign_key "poll_votes", "polls"
  add_foreign_key "poll_votes", "users"
  add_foreign_key "polls", "users"
  add_foreign_key "reviews", "users", column: "reviewer_id"
  add_foreign_key "tickets", "users"
  add_foreign_key "tickets", "users", column: "assigned_leader_id"
  add_foreign_key "user_titles", "users"
end
