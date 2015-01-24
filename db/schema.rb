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

ActiveRecord::Schema.define(version: 20150124195021) do

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

  create_table "courses", force: true do |t|
    t.string   "title",       null: false
    t.string   "course_code", null: false
    t.string   "instructor",  null: false
    t.integer  "school_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "decks", force: true do |t|
    t.string   "title",       null: false
    t.string   "description"
    t.integer  "user_id",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "course_id"
  end

  create_table "registrations", force: true do |t|
    t.integer  "course_id",  null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "responses", force: true do |t|
    t.text     "response_text"
    t.integer  "test_id",       null: false
    t.integer  "card_id",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schools", force: true do |t|
    t.string   "name",       null: false
    t.string   "country",    null: false
    t.string   "state",      null: false
    t.string   "city",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tests", force: true do |t|
    t.integer  "deck_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",    null: false
  end

  create_table "users", force: true do |t|
    t.string   "username",        null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.string   "session_token",   null: false
    t.integer  "school_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["provider", "uid"], name: "index_users_on_provider_and_uid", unique: true, using: :btree
  add_index "users", ["session_token"], name: "index_users_on_session_token", using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
