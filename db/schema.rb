# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_11_14_010231) do

  create_table "properties", force: :cascade do |t|
    t.string "address"
    t.integer "purchase_price"
    t.date "purchase_date"
    t.integer "property_taxes"
    t.integer "building_age"
    t.integer "units"
    t.string "city"
    t.text "description"
    t.integer "renter_id", null: false
    t.integer "owner_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["owner_id"], name: "index_properties_on_owner_id"
    t.index ["renter_id"], name: "index_properties_on_renter_id"
  end

  create_table "units", force: :cascade do |t|
    t.integer "unit"
    t.date "renewal_date"
    t.string "payment_method"
    t.integer "rent_amount_cents"
    t.integer "payment_date"
    t.float "square_meters"
    t.float "bathrooms"
    t.float "bedrooms"
    t.integer "owner_id"
    t.integer "renter_id"
    t.integer "property_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["owner_id"], name: "index_units_on_owner_id"
    t.index ["property_id"], name: "index_units_on_property_id"
    t.index ["renter_id"], name: "index_units_on_renter_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.integer "role"
    t.string "address"
    t.string "postal_code"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "properties", "users", column: "owner_id"
  add_foreign_key "properties", "users", column: "renter_id"
  add_foreign_key "units", "properties"
  add_foreign_key "units", "users", column: "owner_id"
  add_foreign_key "units", "users", column: "renter_id"
end
