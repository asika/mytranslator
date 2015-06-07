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

ActiveRecord::Schema.define(version: 20150607054534) do

  create_table "case_types", force: :cascade do |t|
    t.string   "unit",             limit: 255
    t.decimal  "min_price",                    precision: 3, scale: 1
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.integer  "from_language_id", limit: 4,                           null: false
    t.integer  "to_language_id",   limit: 4,                           null: false
  end

  create_table "cases", force: :cascade do |t|
    t.integer  "client_id",               limit: 4
    t.integer  "translator_id",           limit: 4
    t.integer  "case_type_id",            limit: 4
    t.integer  "domain_id",               limit: 4
    t.integer  "word_count",              limit: 4
    t.decimal  "price",                               precision: 10
    t.datetime "due"
    t.integer  "quality_level_id",        limit: 4
    t.string   "friendly_id",             limit: 255
    t.string   "status",                  limit: 255,                default: "new"
    t.datetime "created_at",                                                         null: false
    t.datetime "updated_at",                                                         null: false
    t.string   "attachment_file_name",    limit: 255
    t.string   "attachment_content_type", limit: 255
    t.integer  "attachment_file_size",    limit: 4
    t.datetime "attachment_updated_at"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "unit",       limit: 255
    t.decimal  "min_price",              precision: 10
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "domains", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "domains", ["name"], name: "index_domains_on_name", using: :btree

  create_table "invitations", force: :cascade do |t|
    t.integer  "client_id",     limit: 4
    t.integer  "translator_id", limit: 4
    t.datetime "expire"
    t.string   "status",        limit: 255, default: "new"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.integer  "case_id",       limit: 4
  end

  add_index "invitations", ["case_id", "client_id", "translator_id"], name: "index_invitations_on_case_id_and_client_id_and_translator_id", unique: true, using: :btree
  add_index "invitations", ["client_id"], name: "index_invitations_on_client_id", using: :btree
  add_index "invitations", ["translator_id"], name: "index_invitations_on_translator_id", using: :btree

  create_table "languages", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "from",       limit: 4,     null: false
    t.integer  "to",         limit: 4,     null: false
    t.text     "content",    limit: 65535, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "messages", ["from"], name: "index_messages_on_from", using: :btree
  add_index "messages", ["to"], name: "index_messages_on_to", using: :btree

  create_table "pricings", force: :cascade do |t|
    t.integer  "case_type_id", limit: 4
    t.decimal  "amount",                 precision: 3, scale: 1
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.integer  "profile_id",   limit: 4
    t.integer  "pass_test_id", limit: 4,                         null: false
  end

  create_table "profile_domainships", force: :cascade do |t|
    t.integer  "profile_id", limit: 4
    t.integer  "domain_id",  limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "profile_domainships", ["domain_id"], name: "index_profile_domainships_on_domain_id", using: :btree
  add_index "profile_domainships", ["profile_id"], name: "index_profile_domainships_on_profile_id", using: :btree

  create_table "profile_langships", force: :cascade do |t|
    t.integer  "profile_id",  limit: 4
    t.integer  "language_id", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.text     "about",               limit: 65535
    t.text     "education",           limit: 65535
    t.text     "professional",        limit: 65535
    t.text     "experience",          limit: 65535
    t.text     "certification",       limit: 65535
    t.text     "payment_info",        limit: 65535
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
    t.string   "short_summary",       limit: 255
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size",    limit: 4
    t.datetime "avatar_updated_at"
    t.integer  "user_id",             limit: 4
    t.string   "sample_file_name",    limit: 255
    t.string   "sample_content_type", limit: 255
    t.integer  "sample_file_size",    limit: 4
    t.datetime "sample_updated_at"
    t.integer  "quality_level_id",    limit: 4
    t.string   "status",              limit: 255,   default: "unverified", null: false
  end

  create_table "quality_levels", force: :cascade do |t|
    t.integer  "level",      limit: 4
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "case_id",    limit: 4,     null: false
    t.integer  "score",      limit: 4,     null: false
    t.integer  "from",       limit: 4,     null: false
    t.integer  "to",         limit: 4,     null: false
    t.text     "comment",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "ratings", ["case_id", "from", "to"], name: "index_ratings_on_case_id_and_from_and_to", unique: true, using: :btree
  add_index "ratings", ["case_id"], name: "index_ratings_on_case_id", using: :btree
  add_index "ratings", ["from"], name: "index_ratings_on_from", using: :btree
  add_index "ratings", ["to"], name: "index_ratings_on_to", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name",       limit: 255,                 null: false
    t.boolean  "privileged", limit: 1,   default: false, null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "test_sources", force: :cascade do |t|
    t.integer  "case_type_id",        limit: 4,   null: false
    t.string   "source_file_name",    limit: 255, null: false
    t.string   "source_content_type", limit: 255, null: false
    t.integer  "source_file_size",    limit: 4,   null: false
    t.datetime "source_updated_at",               null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "tests", force: :cascade do |t|
    t.integer  "profile_id",     limit: 4,     null: false
    t.integer  "test_source_id", limit: 4,     null: false
    t.datetime "submit_time"
    t.text     "answer",         limit: 65535
    t.integer  "score",          limit: 4
    t.text     "comment",        limit: 65535
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username",               limit: 255,                 null: false
    t.string   "first_name",             limit: 255,                 null: false
    t.string   "last_name",              limit: 255,                 null: false
    t.string   "phone",                  limit: 255,                 null: false
    t.boolean  "agreement",              limit: 1,   default: false, null: false
    t.integer  "role_id",                limit: 4,                   null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
