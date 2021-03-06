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

ActiveRecord::Schema.define(version: 2020_04_18_100908) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pets", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.string "status"
    t.string "photo_urls", null: false, array: true
    t.string "tags", array: true
    t.integer "category_id"
    t.integer "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_pets_on_category_id"
    t.index ["owner_id"], name: "index_pets_on_owner_id"
  end

  create_table "user_pet_bids", id: :serial, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "pet_id", null: false
    t.decimal "amount", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pet_id"], name: "index_user_pet_bids_on_pet_id"
    t.index ["user_id"], name: "index_user_pet_bids_on_user_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "email"
    t.string "password"
    t.integer "user_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "pets", "categories"
  add_foreign_key "pets", "users", column: "owner_id"
  add_foreign_key "user_pet_bids", "pets"
  add_foreign_key "user_pet_bids", "users"
end
