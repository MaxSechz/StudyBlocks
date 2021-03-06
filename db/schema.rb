# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150205223717) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: true do |t|
    t.text     "front"
    t.text     "back",               null: false
    t.string   "format"
    t.integer  "deck_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "cards", ["deck_id"], name: "index_cards_on_deck_id", using: :btree

  create_table "courses", force: true do |t|
    t.string   "title",       null: false
    t.string   "course_code", null: false
    t.string   "instructor",  null: false
    t.integer  "school_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "courses", ["school_id"], name: "index_courses_on_school_id", using: :btree

  create_table "decks", force: true do |t|
    t.string   "title",       null: false
    t.string   "description"
    t.integer  "user_id",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "course_id"
  end

  add_index "decks", ["user_id"], name: "index_decks_on_user_id", using: :btree

  create_table "registrations", force: true do |t|
    t.integer  "course_id",  null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "registrations", ["course_id", "user_id"], name: "index_registrations_on_course_id_and_user_id", unique: true, using: :btree

  create_table "responses", force: true do |t|
    t.text     "response_text"
    t.integer  "test_id",       null: false
    t.integer  "card_id",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "responses", ["test_id", "card_id"], name: "index_responses_on_test_id_and_card_id", unique: true, using: :btree

  create_table "schools", force: true do |t|
    t.string   "name",       null: false
    t.string   "country",    null: false
    t.string   "state",      null: false
    t.string   "city",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", force: true do |t|
    t.string  "session_token"
    t.integer "user_id"
  end

  add_index "sessions", ["user_id"], name: "index_sessions_on_user_id", using: :btree

  create_table "tests", force: true do |t|
    t.integer  "deck_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",    null: false
  end

  add_index "tests", ["user_id", "deck_id"], name: "index_tests_on_user_id_and_deck_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "username",        null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.integer  "school_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["provider", "uid"], name: "index_users_on_provider_and_uid", unique: true, using: :btree
  add_index "users", ["school_id"], name: "index_users_on_school_id", using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
