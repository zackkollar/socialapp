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

ActiveRecord::Schema.define(version: 20130903080643) do

  create_table "bits", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "bits", ["email"], name: "index_bits_on_email", unique: true
  add_index "bits", ["reset_password_token"], name: "index_bits_on_reset_password_token", unique: true

  create_table "comments", force: true do |t|
    t.integer  "post_id"
    t.integer  "bit_id"
    t.text     "body"
    t.boolean  "reply"
    t.integer  "reply_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "follows", force: true do |t|
    t.integer  "bit_id"
    t.integer  "follow_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notifications", force: true do |t|
    t.string   "type"
    t.integer  "content_id"
    t.integer  "bit_id"
    t.boolean  "seen"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "from_id"
  end

  create_table "posts", force: true do |t|
    t.text     "body"
    t.integer  "bit_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles", force: true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "bio"
    t.string   "location"
    t.boolean  "location_visible", default: true
    t.string   "website"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "bit_id"
    t.string   "avatar_file_name"
  end

end
