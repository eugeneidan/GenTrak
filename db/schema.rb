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

ActiveRecord::Schema.define(version: 20150429174600) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "checkins", force: :cascade do |t|
    t.datetime "dateIn"
    t.integer  "item_id"
    t.string   "source"
    t.string   "purpose"
    t.string   "serialNo"
    t.string   "waybillNo"
    t.string   "receivedBy"
    t.string   "sentBy"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "state"
    t.boolean  "checked_out"
  end

  add_index "checkins", ["item_id"], name: "index_checkins_on_item_id", using: :btree

  create_table "checkouts", force: :cascade do |t|
    t.date     "dateOut"
    t.integer  "checkin_id"
    t.string   "state"
    t.string   "destination"
    t.string   "purpose"
    t.string   "serial_no"
    t.string   "dispatchedBy"
    t.string   "receivedBy"
    t.string   "waybillNo"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "checkouts", ["checkin_id"], name: "index_checkouts_on_checkin_id", using: :btree

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.string   "desc"
    t.integer  "unit_px"
    t.integer  "total_qty"
    t.string   "code"
    t.string   "item_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "checkins", "items"
  add_foreign_key "checkouts", "checkins"
end
