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

ActiveRecord::Schema.define(version: 20140719040231) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cliqs", force: true do |t|
    t.integer  "parent_id"
    t.integer  "lftp",                                                  null: false
    t.integer  "lftq",                                                  null: false
    t.integer  "rgtp",                                                  null: false
    t.integer  "rgtq",                                                  null: false
    t.decimal  "lft",         precision: 31, scale: 30,                 null: false
    t.decimal  "rgt",         precision: 31, scale: 30,                 null: false
    t.string   "name",                                                  null: false
    t.boolean  "is_category",                           default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cliqs", ["lft"], name: "index_cliqs_on_lft", using: :btree
  add_index "cliqs", ["lftp", "lftq", "rgtq", "rgtp"], name: "index_cliqs_on_lftp_and_lftq_and_rgtq_and_rgtp", unique: true, using: :btree
  add_index "cliqs", ["lftp"], name: "index_cliqs_on_lftp", using: :btree
  add_index "cliqs", ["lftq"], name: "index_cliqs_on_lftq", using: :btree
  add_index "cliqs", ["parent_id"], name: "index_cliqs_on_parent_id", using: :btree
  add_index "cliqs", ["rgt"], name: "index_cliqs_on_rgt", using: :btree

  create_table "colors", force: true do |t|
    t.string   "name"
    t.string   "color_hex"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.integer  "topic_id"
    t.integer  "user_id"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", id: false, force: true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "topics", force: true do |t|
    t.text     "subject"
    t.text     "body"
    t.integer  "user_id"
    t.integer  "cliq_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
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
    t.string   "username"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
