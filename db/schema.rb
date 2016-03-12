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

ActiveRecord::Schema.define(version: 20160123135212) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "airlines", force: :cascade do |t|
    t.string   "airline_name"
    t.string   "airline_address"
    t.string   "country"
    t.string   "contact_person_name"
    t.string   "contact_person_address"
    t.string   "contact_person_email"
    t.integer  "contact_number",         limit: 8
    t.string   "iata_code"
    t.string   "caa_license"
    t.integer  "year_in_service"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "airplanes", force: :cascade do |t|
    t.string   "company_name"
    t.string   "area_of_service"
    t.string   "contact_name"
    t.string   "contact_address"
    t.string   "contact_phone"
    t.integer  "iata_code"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "caa_licence"
  end

  create_table "broker_profiles", force: :cascade do |t|
    t.string   "area_of_service"
    t.string   "company_name"
    t.string   "contact_name"
    t.string   "contact_address"
    t.string   "contact_phone"
    t.string   "iata_code"
    t.integer  "year_in_service"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "zip"
    t.string   "country"
  end

  create_table "broker_quotes", force: :cascade do |t|
    t.string   "from_airpot"
    t.string   "to_airpot"
    t.datetime "date_required"
    t.string   "nature_of_cargo"
    t.string   "un_number"
    t.string   "payload"
    t.string   "volume"
    t.string   "cargo_dimension_width"
    t.string   "cargo_dimension_length"
    t.string   "cargo_dimension_height"
    t.integer  "quantiy"
    t.integer  "user_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "name"
    t.string   "company_name"
    t.string   "email"
    t.string   "uan_number"
    t.string   "phone_number"
    t.string   "hear"
    t.string   "additional_information"
    t.string   "special_requirements"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "airline_id"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

end
