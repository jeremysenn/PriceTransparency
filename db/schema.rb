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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130810221116) do

  create_table "health_providers", :force => true do |t|
    t.integer  "provider_id"
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.string   "hospital_referral_region_description"
    t.integer  "year"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "inpatient_procedures", :force => true do |t|
    t.string   "drg"
    t.integer  "total_discharges"
    t.decimal  "average_covered_charges", :precision => 10, :scale => 0
    t.decimal  "average_total_payments",  :precision => 10, :scale => 0
    t.integer  "year"
    t.datetime "created_at",                                             :null => false
    t.datetime "updated_at",                                             :null => false
  end

  create_table "outpatient_procedures", :force => true do |t|
    t.string   "apc"
    t.integer  "outpatient_services"
    t.decimal  "average_estimated_submitted_charges", :precision => 10, :scale => 0
    t.decimal  "average_total_payments",              :precision => 10, :scale => 0
    t.datetime "created_at",                                                         :null => false
    t.datetime "updated_at",                                                         :null => false
    t.integer  "year"
  end

  create_table "provider_inpatient_procedures", :force => true do |t|
    t.string   "drg"
    t.integer  "provider_id"
    t.string   "provider_name"
    t.string   "provider_street_address"
    t.string   "provider_city"
    t.string   "provider_state"
    t.string   "provider_zipcode"
    t.string   "hospital_referral_region_description"
    t.integer  "total_discharges"
    t.decimal  "average_covered_charges",              :precision => 10, :scale => 0
    t.decimal  "average_total_payments",               :precision => 10, :scale => 0
    t.integer  "year"
    t.datetime "created_at",                                                          :null => false
    t.datetime "updated_at",                                                          :null => false
  end

  create_table "provider_outpatient_procedures", :force => true do |t|
    t.string   "apc"
    t.integer  "provider_id"
    t.string   "provider_name"
    t.string   "provider_street_address"
    t.string   "provider_city"
    t.string   "provider_state"
    t.string   "provider_zipcode"
    t.string   "hospital_referral_region_description"
    t.integer  "outpatient_services"
    t.decimal  "average_estimated_submitted_charges",  :precision => 10, :scale => 0
    t.decimal  "average_total_payments",               :precision => 10, :scale => 0
    t.integer  "year"
    t.datetime "created_at",                                                          :null => false
    t.datetime "updated_at",                                                          :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "state_inpatient_procedures", :force => true do |t|
    t.string   "drg"
    t.string   "provider_state"
    t.integer  "total_discharges"
    t.decimal  "average_covered_charges", :precision => 10, :scale => 0
    t.decimal  "average_total_payments",  :precision => 10, :scale => 0
    t.integer  "year"
    t.datetime "created_at",                                             :null => false
    t.datetime "updated_at",                                             :null => false
  end

  create_table "state_outpatient_procedures", :force => true do |t|
    t.string   "apc"
    t.string   "provider_state"
    t.integer  "outpatient_services"
    t.integer  "average_estimated_submitted_charges"
    t.integer  "average_total_payments"
    t.integer  "year"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

end
