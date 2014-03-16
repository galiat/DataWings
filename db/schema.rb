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

ActiveRecord::Schema.define(version: 20140316023708) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "data_transmitions", force: true do |t|
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

  add_index "data_transmitions", ["firefly_id"], name: "index_data_transmitions_on_firefly_id", using: :btree

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
  end

  create_table "sponsors", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
