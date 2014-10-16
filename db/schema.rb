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

ActiveRecord::Schema.define(version: 20141009093400) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "business_contact_phones", force: true do |t|
    t.integer  "contact_phone_id"
    t.integer  "business_id"
    t.boolean  "IsRecommended"
    t.string   "CreatedBy",        limit: 50
    t.string   "ModifiedBy",       limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "businesses", force: true do |t|
    t.string   "BusinessName"
    t.string   "BusinessType",  limit: 50
    t.string   "BusinessPhone", limit: 50
    t.integer  "CityListingId"
    t.string   "CreatedBy",     limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contact_phones", force: true do |t|
    t.integer  "contact_id"
    t.string   "PhoneNumber",     limit: 50
    t.string   "PhoneNumberType", limit: 50
    t.string   "CreatedBy",       limit: 50
    t.string   "ModifiedBy",      limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", force: true do |t|
    t.integer  "device_id"
    t.string   "ContactName"
    t.string   "CreatedBy",   limit: 50
    t.string   "ModifiedBy",  limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "devices", force: true do |t|
    t.string   "UserPhoneNumber", limit: 50
    t.string   "OEMId"
    t.string   "OS",              limit: 50
    t.decimal  "Lat",                        precision: 10, scale: 6
    t.decimal  "Lng",                        precision: 10, scale: 6
    t.string   "CreatedBy",       limit: 50
    t.string   "ModifiedBy",      limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
