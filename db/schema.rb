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

ActiveRecord::Schema.define(version: 20180327183307) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "faqs", force: :cascade do |t|
    t.string "question"
    t.text "answer"
    t.string "topic"
  end

  create_table "property_forms", force: :cascade do |t|
    t.string "address"
    t.string "property_type"
    t.integer "num_floors"
    t.integer "num_rooms"
    t.integer "num_bedrooms"
    t.integer "num_bathrooms"
    t.integer "property_total_size_sqm"
    t.integer "size_balcony_sqm"
    t.integer "size_terrace_sqm"
    t.integer "size_cellar_sqm"
    t.integer "building_construction_year"
    t.boolean "has_balcony"
    t.boolean "has_garage"
    t.boolean "has_terrace"
    t.boolean "has_cellar"
    t.boolean "has_parking"
    t.boolean "has_elevator"
    t.boolean "has_works_in_building_planned"
    t.string "building_state"
    t.string "property_state"
    t.string "kitchen_state"
    t.string "bathroom_state"
    t.boolean "complete"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.float "latitude"
    t.float "longitude"
    t.boolean "has_pool"
    t.boolean "has_attic"
    t.boolean "is_attic_convertible"
    t.integer "appartment_floor"
    t.integer "livable_size_sqm"
    t.integer "ground_floor_size_sqm"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone_number"
    t.string "time_to_sell"
    t.string "token"
    t.integer "price"
    t.string "title"
    t.index ["user_id"], name: "index_property_forms_on_user_id"
  end

  create_table "property_images", force: :cascade do |t|
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "real_estate_property_id"
    t.bigint "property_form_id"
    t.index ["property_form_id"], name: "index_property_images_on_property_form_id"
    t.index ["real_estate_property_id"], name: "index_property_images_on_real_estate_property_id"
  end

  create_table "real_estate_properties", force: :cascade do |t|
    t.string "address"
    t.string "property_type"
    t.integer "num_floors"
    t.integer "num_rooms"
    t.integer "num_bedrooms"
    t.integer "num_bathrooms"
    t.integer "property_total_size_sqm"
    t.integer "size_balcony_sqm"
    t.integer "size_terrace_sqm"
    t.integer "size_cellar_sqm"
    t.integer "building_construction_year"
    t.boolean "has_balcony"
    t.boolean "has_garage"
    t.boolean "has_terrace"
    t.boolean "has_cellar"
    t.boolean "has_parking"
    t.boolean "has_elevator"
    t.boolean "has_works_in_building_planned"
    t.string "building_state"
    t.string "property_state"
    t.string "kitchen_state"
    t.string "bathroom_state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "property_form_id"
    t.float "latitude"
    t.float "longitude"
    t.boolean "has_pool"
    t.boolean "has_attic"
    t.boolean "is_attic_convertible"
    t.integer "appartment_floor"
    t.integer "livable_size_sqm"
    t.integer "ground_floor_size_sqm"
    t.string "time_to_sell"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone_number"
    t.string "token"
    t.integer "price"
    t.string "title"
    t.index ["property_form_id"], name: "index_real_estate_properties_on_property_form_id"
    t.index ["user_id"], name: "index_real_estate_properties_on_user_id"
  end

  create_table "requests", force: :cascade do |t|
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.string "landing"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phone_number"
    t.string "first_name"
    t.string "last_name"
    t.boolean "admin", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "property_forms", "users"
  add_foreign_key "property_images", "property_forms"
  add_foreign_key "property_images", "real_estate_properties"
  add_foreign_key "real_estate_properties", "property_forms"
  add_foreign_key "real_estate_properties", "users"
end
