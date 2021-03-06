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

ActiveRecord::Schema.define(:version => 20130707205135) do

  create_table "activities", :force => true do |t|
    t.string   "name",                 :null => false
    t.text     "description",          :null => false
    t.integer  "activity_category_id", :null => false
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "activity_categories", :force => true do |t|
    t.string   "activity_category", :null => false
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "activity_logs", :force => true do |t|
    t.string   "name",                 :null => false
    t.string   "description"
    t.text     "note"
    t.integer  "rating"
    t.time     "time"
    t.integer  "weight"
    t.integer  "sets"
    t.integer  "repetitions"
    t.integer  "activity_category_id", :null => false
    t.integer  "child_account_id",     :null => false
    t.date     "date",                 :null => false
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "child_accounts", :force => true do |t|
    t.string   "username",          :null => false
    t.string   "gender",            :null => false
    t.date     "date_of_birth",     :null => false
    t.integer  "family_account_id", :null => false
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "family_accounts", :force => true do |t|
    t.string   "email",                                     :null => false
    t.string   "first_name",                                :null => false
    t.string   "last_name",                                 :null => false
    t.date     "date_of_birth",                             :null => false
    t.string   "zip_code",                                  :null => false
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "admin",                  :default => false
  end

  add_index "family_accounts", ["email"], :name => "index_family_accounts_on_email", :unique => true
  add_index "family_accounts", ["reset_password_token"], :name => "index_family_accounts_on_reset_password_token", :unique => true

  create_table "favorite_activities", :force => true do |t|
    t.string   "name",                 :null => false
    t.string   "description"
    t.text     "note"
    t.integer  "rating"
    t.integer  "child_account_id",     :null => false
    t.integer  "activity_category_id", :null => false
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "favorite_foods", :force => true do |t|
    t.string   "name"
    t.integer  "child_account_id", :null => false
    t.text     "note"
    t.integer  "rating"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "food_type_id",     :null => false
    t.integer  "food_category_id"
  end

  create_table "food_categories", :force => true do |t|
    t.string   "food_category", :null => false
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "food_types", :force => true do |t|
    t.string   "food_type",  :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "foods", :force => true do |t|
    t.string   "name",         :null => false
    t.integer  "food_type_id", :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 8
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

end
