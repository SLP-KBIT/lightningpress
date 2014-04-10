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

ActiveRecord::Schema.define(version: 20140409133103) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "candidates", force: true do |t|
    t.integer  "request_id"
    t.integer  "member_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.text     "name"
    t.integer  "member_id"
    t.datetime "start_at"
    t.datetime "end_at"
    t.text     "content_path"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lightningtalks", force: true do |t|
    t.text     "name"
    t.text     "member_id"
    t.datetime "performance_date"
    t.text     "content_path"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "sumally"
  end

  create_table "lt_comments", force: true do |t|
    t.integer  "member_id"
    t.text     "content"
    t.datetime "created_at"
    t.integer  "lightningtalk_id"
    t.datetime "updated_at"
  end

  create_table "lt_preferences", force: true do |t|
    t.integer  "lightningtalk_id"
    t.integer  "grade"
    t.integer  "member_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "members", force: true do |t|
    t.text     "name"
    t.text     "student_number"
    t.text     "account"
    t.text     "password_digest"
    t.boolean  "is_admin"
    t.boolean  "flag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "request_comments", force: true do |t|
    t.integer  "member_id"
    t.text     "content"
    t.datetime "created_at"
    t.integer  "request_id"
    t.boolean  "is_denied"
    t.datetime "updated_at"
  end

  create_table "request_notifications", force: true do |t|
    t.integer  "member_id"
    t.integer  "request_id"
    t.integer  "response_status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "request_preferences", force: true do |t|
    t.integer  "request_id"
    t.integer  "grade"
    t.integer  "member_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "requests", force: true do |t|
    t.integer  "contributor_id"
    t.text     "title"
    t.text     "content"
    t.integer  "presenter_id"
    t.datetime "created_at"
    t.integer  "status"
    t.datetime "updated_at"
  end

end
