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

ActiveRecord::Schema.define(version: 20171031214145) do

  create_table "posts", force: :cascade do |t|
    t.text     "name"
    t.integer  "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "date"
    t.date     "colum"
    t.integer  "dates"
    t.integer  "kg"
    t.integer  "rep"
    t.integer  "kg2"
    t.integer  "rep2"
    t.integer  "kg3"
    t.integer  "rep3"
    t.text     "menu"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "image_name"
    t.string   "password"
    t.text     "friend1"
    t.text     "friend2"
    t.text     "friend_1",   default: "tom"
    t.text     "frined_2",   default: "hakase"
    t.text     "friend_2",   default: "hakase"
  end

end
