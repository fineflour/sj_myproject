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

ActiveRecord::Schema.define(version: 20150323170200) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: true do |t|
    t.string   "address1"
    t.string   "address2"
    t.integer  "city_id"
    t.integer  "state_id"
    t.string   "zipcode"
    t.integer  "contact_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_active",              default: true
    t.string   "city",       limit: 100
    t.string   "state",      limit: 2
    t.integer  "type",       limit: 2
  end

  add_index "addresses", ["city_id"], name: "index_addresses_on_city_id", using: :btree
  add_index "addresses", ["contact_id"], name: "index_addresses_on_contact_id", using: :btree
  add_index "addresses", ["state_id"], name: "index_addresses_on_state_id", using: :btree

  create_table "api_keys", force: true do |t|
    t.string   "access_token"
    t.datetime "expires_at"
    t.integer  "user_id"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "api_keys", ["access_token"], name: "index_api_keys_on_access_token", unique: true, using: :btree
  add_index "api_keys", ["user_id"], name: "index_api_keys_on_user_id", using: :btree

  create_table "cities", force: true do |t|
    t.integer  "state_id"
    t.string   "name"
    t.string   "description"
    t.boolean  "is_active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cities", ["state_id"], name: "index_cities_on_state_id", using: :btree

  create_table "comments", force: true do |t|
    t.text     "body"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "comments", ["post_id"], name: "index_comments_on_post_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "contact_comments", force: true do |t|
    t.integer  "user_id"
    t.integer  "order_id"
    t.integer  "contact_id"
    t.string   "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contact_comments", ["contact_id"], name: "index_contact_comments_on_contact_id", using: :btree
  add_index "contact_comments", ["order_id"], name: "index_contact_comments_on_order_id", using: :btree
  add_index "contact_comments", ["user_id"], name: "index_contact_comments_on_user_id", using: :btree

  create_table "contact_emails", force: true do |t|
    t.integer  "contact_id"
    t.string   "email"
    t.boolean  "is_active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contact_emails", ["contact_id"], name: "index_contact_emails_on_contact_id", using: :btree

  create_table "contacts", force: true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.integer  "age",                           default: 0
    t.boolean  "is_deleted"
    t.boolean  "is_ops_contact"
    t.boolean  "followup_interest"
    t.boolean  "biblestudy_interest"
    t.datetime "date_contacted"
    t.datetime "date_imported"
    t.integer  "language_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ops_customer_id"
    t.string   "gender",              limit: 1
  end

  add_index "contacts", ["language_id"], name: "index_contacts_on_language_id", using: :btree

  create_table "favorites", force: true do |t|
    t.integer  "post_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "favorites", ["post_id"], name: "index_favorites_on_post_id", using: :btree
  add_index "favorites", ["user_id"], name: "index_favorites_on_user_id", using: :btree

  create_table "groups", force: true do |t|
    t.integer  "team_id"
    t.string   "name"
    t.string   "calender"
    t.string   "description"
    t.boolean  "is_active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "groups", ["team_id"], name: "index_groups_on_team_id", using: :btree

  create_table "material_categories", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "materials", force: true do |t|
    t.integer  "MaterialCategory_id"
    t.string   "name"
    t.string   "shortname"
    t.string   "description"
    t.boolean  "is_active"
    t.integer  "language_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "materials", ["MaterialCategory_id"], name: "index_materials_on_MaterialCategory_id", using: :btree
  add_index "materials", ["language_id"], name: "index_materials_on_language_id", using: :btree

  create_table "order_products", force: true do |t|
    t.integer  "order_id"
    t.integer  "contact_id"
    t.boolean  "is_ops_order"
    t.integer  "material_id"
    t.integer  "status"
    t.datetime "ops_date_markasshiped"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "order_products", ["contact_id"], name: "index_order_products_on_contact_id", using: :btree
  add_index "order_products", ["material_id"], name: "index_order_products_on_material_id", using: :btree
  add_index "order_products", ["order_id"], name: "index_order_products_on_order_id", using: :btree

  create_table "orders", force: true do |t|
    t.integer  "contact_id"
    t.boolean  "is_ops_order"
    t.datetime "ops_date_ordered"
    t.datetime "ops_date_fulfilled"
    t.datetime "ops_date_markasshiped"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orders", ["contact_id"], name: "index_orders_on_contact_id", using: :btree

  create_table "posts", force: true do |t|
    t.text     "body"
    t.string   "image"
    t.float    "rank"
    t.string   "title"
    t.integer  "topic_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "states", force: true do |t|
    t.string   "name"
    t.string   "abbname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: true do |t|
    t.integer  "city_id"
    t.string   "name"
    t.string   "calender"
    t.boolean  "is_active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "teams", ["city_id"], name: "index_teams_on_city_id", using: :btree

  create_table "topics", force: true do |t|
    t.string   "name"
    t.boolean  "public",      default: true
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
    t.string   "avatar"
    t.boolean  "email_favorites",        default: true
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "votes", force: true do |t|
    t.integer  "user_id"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "value"
  end

  add_index "votes", ["post_id"], name: "index_votes_on_post_id", using: :btree
  add_index "votes", ["user_id"], name: "index_votes_on_user_id", using: :btree

  create_table "zipcodes", force: true do |t|
    t.integer  "city_id"
    t.string   "zipcode_id"
    t.string   "zipcode"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "type"
  end

  add_index "zipcodes", ["city_id"], name: "index_zipcodes_on_city_id", using: :btree

end
