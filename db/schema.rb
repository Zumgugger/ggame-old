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

ActiveRecord::Schema.define(version: 20160910145204) do

  create_table "events", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "time"
    t.integer  "group_id"
    t.boolean  "noticed"
    t.integer  "points_set"
    t.integer  "target_id"
    t.string   "description"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "target_group_id"
    t.integer  "group_points"
    t.integer  "target_points"
    t.integer  "target_group_points"
    t.integer  "option_id"
    t.index ["group_id"], name: "index_events_on_group_id", using: :btree
    t.index ["option_id"], name: "index_events_on_option_id", using: :btree
    t.index ["target_group_id"], name: "index_events_on_target_group_id", using: :btree
    t.index ["target_id"], name: "index_events_on_target_id", using: :btree
  end

  create_table "groups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "points",            default: 0
    t.string   "member1"
    t.string   "member2"
    t.string   "member3"
    t.string   "member4"
    t.string   "natel1"
    t.string   "natel2"
    t.string   "natel3"
    t.string   "natel4"
    t.boolean  "false_information"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "kopfgeld",          default: 0
    t.integer  "sort_order"
  end

  create_table "options", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "count"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.boolean  "active",     default: true
  end

  create_table "targets", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "points"
    t.integer  "mines",       default: 0
    t.integer  "count",       default: 0
    t.datetime "last_action"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "village"
    t.integer  "sort_order"
  end

  add_foreign_key "events", "groups"
  add_foreign_key "events", "options"
  add_foreign_key "events", "targets"
end
