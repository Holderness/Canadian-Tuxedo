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

ActiveRecord::Schema.define(version: 20141121144945) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clothing_assignments", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "clothing_item_id"
    t.integer  "look_id"
  end

  create_table "clothing_items", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "caption"
    t.integer  "user_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "clothing_tag_assignments", force: true do |t|
    t.integer  "tag_id"
    t.integer  "clothing_item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "clothing_tag_assignments", ["clothing_item_id"], name: "index_clothing_tag_assignments_on_clothing_item_id", using: :btree
  add_index "clothing_tag_assignments", ["tag_id"], name: "index_clothing_tag_assignments_on_tag_id", using: :btree

  create_table "comments", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "look_tag_assignments", force: true do |t|
    t.integer  "tag_id"
    t.integer  "look_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "look_tag_assignments", ["look_id"], name: "index_look_tag_assignments_on_look_id", using: :btree
  add_index "look_tag_assignments", ["tag_id"], name: "index_look_tag_assignments_on_tag_id", using: :btree

  create_table "looks", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "user_id"
  end

  create_table "tags", force: true do |t|
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "votes", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "look_id"
    t.integer  "user_id"
    t.integer  "vote"
  end

  add_index "votes", ["look_id"], name: "index_votes_on_look_id", using: :btree
  add_index "votes", ["user_id"], name: "index_votes_on_user_id", using: :btree

end
