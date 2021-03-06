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

ActiveRecord::Schema.define(version: 20150421233505) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contacts", force: :cascade do |t|
    t.string   "name"
    t.text     "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "email"
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.string   "venue"
    t.datetime "time"
    t.integer  "capacity"
    t.string   "phone_number",        limit: 20
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "category"
    t.text     "details"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "created_by"
  end

  add_index "events", ["name"], name: "index_events_on_name", using: :btree
  add_index "events", ["time"], name: "index_events_on_time", using: :btree

  create_table "events_groups", id: false, force: :cascade do |t|
    t.integer "event_id"
    t.integer "group_id"
  end

  add_index "events_groups", ["event_id", "group_id"], name: "index_events_groups_on_event_id_and_group_id", using: :btree

  create_table "events_users", id: false, force: :cascade do |t|
    t.integer "event_id"
    t.integer "user_id"
  end

  add_index "events_users", ["event_id", "user_id"], name: "index_events_users_on_event_id_and_user_id", using: :btree

  create_table "faqcomments", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "faqcomments", ["user_id"], name: "index_faqcomments_on_user_id", using: :btree

  create_table "groups", force: :cascade do |t|
    t.string   "group_name",          limit: 50
    t.string   "category",            limit: 50
    t.string   "phone_number",        limit: 20
    t.text     "details"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.time     "time"
    t.string   "venue"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "day"
    t.integer  "created_by"
  end

  add_index "groups", ["group_name"], name: "index_groups_on_group_name", using: :btree

  create_table "groups_users", id: false, force: :cascade do |t|
    t.integer "group_id"
    t.integer "user_id"
  end

  add_index "groups_users", ["group_id", "user_id"], name: "index_groups_users_on_group_id_and_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",            limit: 30
    t.string   "fname",               limit: 15
    t.string   "lname",               limit: 15
    t.date     "date_of_birth"
    t.string   "gender"
    t.text     "address"
    t.string   "email",               limit: 20
    t.string   "phone_number",        limit: 20
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.boolean  "admin"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["date_of_birth"], name: "index_users_on_date_of_birth", using: :btree
  add_index "users", ["username"], name: "index_users_on_username", using: :btree

  add_foreign_key "faqcomments", "users"
end
