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

ActiveRecord::Schema.define(version: 20170603104032) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentications", force: :cascade do |t|
    t.string "uid"
    t.string "token"
    t.string "provider"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_authentications_on_user_id"
  end

  create_table "listings", force: :cascade do |t|
    t.bigint "user_id"
    t.string "address1"
    t.string "address2"
    t.integer "postalcode"
    t.string "state"
    t.string "country"
    t.integer "no_bed"
    t.integer "no_room"
    t.integer "max_guest"
    t.integer "price_per_day"
    t.string "currency"
    t.string "content"
    t.boolean "smoker"
    t.boolean "pets"
    t.boolean "instant_book"
    t.string "property_type"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.json "photos"
    t.index ["user_id"], name: "index_listings_on_user_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "listing_id"
    t.integer "total_price"
    t.string "currency"
    t.date "start_date"
    t.date "end_date"
    t.string "message"
    t.integer "num_guest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["listing_id"], name: "index_reservations_on_listing_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "searches", force: :cascade do |t|
    t.string "keyword"
    t.string "state"
    t.string "country"
    t.integer "no_bed"
    t.integer "no_room"
    t.integer "no_guest"
    t.integer "min_price"
    t.integer "max_price"
    t.boolean "smoker"
    t.boolean "pets"
    t.boolean "instant_book"
    t.string "property_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", null: false
    t.string "encrypted_password", limit: 128
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128, null: false
    t.string "first_name"
    t.string "last_name"
    t.integer "access_level", default: 0
    t.string "profilepic"
    t.index ["email"], name: "index_users_on_email"
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

  add_foreign_key "authentications", "users"
  add_foreign_key "reservations", "listings"
  add_foreign_key "reservations", "users"
end
