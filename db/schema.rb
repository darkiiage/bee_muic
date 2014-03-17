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

ActiveRecord::Schema.define(version: 20140314110358) do

  create_table "events", force: true do |t|
    t.string   "event_name"
    t.text     "event_description"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "event_type"
    t.integer  "event_cost"
    t.string   "event_guest_type"
    t.integer  "event_guest_limit"
    t.string   "event_image"
    t.boolean  "event_food"
    t.boolean  "event_preregist"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events", ["user_id", "start_date"], name: "index_events_on_user_id_and_start_date"

  create_table "faculties", force: true do |t|
    t.string   "faculty_name"
    t.string   "faculty_short_name"
    t.string   "faculty_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "relationships", force: true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id"

  create_table "users", force: true do |t|
    t.string   "finame"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "faculty"
    t.string   "major"
    t.text     "description"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
