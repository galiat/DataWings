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

ActiveRecord::Schema.define(version: 20140502223746) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "data_transmissions", force: true do |t|
    t.integer  "firefly_id"
    t.datetime "sent_at"
    t.integer  "hour_meter"
    t.integer  "high_temp"
    t.integer  "low_temp"
    t.integer  "min_voltage"
    t.integer  "max_voltage"
    t.string   "error_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "data_transmissions", ["firefly_id"], name: "index_data_transmissions_on_firefly_id", using: :btree

  create_table "fireflies", force: true do |t|
    t.string   "device_id"
    t.integer  "hospital_id"
    t.integer  "sponsor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fireflies", ["hospital_id"], name: "index_fireflies_on_hospital_id", using: :btree
  add_index "fireflies", ["sponsor_id"], name: "index_fireflies_on_sponsor_id", using: :btree

  create_table "hospitals", force: true do |t|
    t.string   "name"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "country_code"
  end

  create_table "sponsors", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
