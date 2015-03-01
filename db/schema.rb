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

ActiveRecord::Schema.define(version: 20150224155804) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "groups", force: :cascade do |t|
    t.string   "group_account",                   null: false
    t.string   "group_name",                      null: false
    t.string   "email",                           null: false
    t.string   "hashed_password"
    t.text     "description"
    t.boolean  "deleted",         default: false, null: false
    t.boolean  "suspended",       default: false, null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "groups", ["email"], name: "index_groups_on_email", unique: true, using: :btree
  add_index "groups", ["group_account"], name: "index_groups_on_group_account", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "account",                         null: false
    t.string   "name"
    t.string   "email",                           null: false
    t.string   "hashed_password"
    t.integer  "permit_level",                    null: false
    t.integer  "group_id",                        null: false
    t.boolean  "deleted",         default: false, null: false
    t.boolean  "suspended",       default: false, null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "users", ["account"], name: "index_users_on_account", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["group_id"], name: "index_users_on_group_id", using: :btree

  add_foreign_key "users", "groups"
end