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

ActiveRecord::Schema.define(version: 20141008173551) do

  create_table "locations", force: :cascade do |t|
    t.string   "address",           limit: 255
    t.string   "latitude",          limit: 255
    t.string   "longitude",         limit: 255
    t.integer  "locationable_id",   limit: 4
    t.string   "locationable_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "locations", ["locationable_type", "locationable_id"], name: "index_locations_on_locationable_type_and_locationable_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "login",           limit: 255
    t.string   "email",           limit: 255
    t.string   "password_digest", limit: 255
    t.string   "token",           limit: 255
    t.boolean  "confirmed",       limit: 1,   default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["token"], name: "index_users_on_token", using: :btree

end
