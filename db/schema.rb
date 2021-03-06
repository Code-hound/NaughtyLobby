# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_12_07_122327) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "meetings", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.bigint "user_id"
    t.bigint "politician_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["politician_id"], name: "index_meetings_on_politician_id"
    t.index ["user_id"], name: "index_meetings_on_user_id"
  end

  create_table "politicians", force: :cascade do |t|
    t.string "name"
    t.string "party"
    t.integer "current_salary"
    t.integer "daily_price"
    t.integer "vote_price"
    t.string "location"
    t.text "general_description"
    t.string "tag_line"
    t.string "photo_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "banner"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.text "description"
    t.string "title"
    t.bigint "user_id"
    t.bigint "politician_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "used_services", default: false, null: false
    t.index ["politician_id"], name: "index_reviews_on_politician_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "photo_url", default: "https://github.com/Code-hound/NaughtyLobby/blob/master/app/assets/images/nl_logo.png"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.boolean "position"
    t.string "subject"
    t.bigint "user_id"
    t.bigint "politician_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["politician_id"], name: "index_votes_on_politician_id"
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

  add_foreign_key "meetings", "politicians"
  add_foreign_key "meetings", "users"
  add_foreign_key "reviews", "politicians"
  add_foreign_key "reviews", "users"
  add_foreign_key "votes", "politicians"
  add_foreign_key "votes", "users"
end
