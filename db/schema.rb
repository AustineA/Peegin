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

ActiveRecord::Schema.define(version: 20180315151913) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "impressions", force: :cascade do |t|
    t.string   "impressionable_type"
    t.integer  "impressionable_id"
    t.integer  "user_id"
    t.string   "controller_name"
    t.string   "action_name"
    t.string   "view_name"
    t.string   "request_hash"
    t.string   "ip_address"
    t.string   "session_hash"
    t.text     "message"
    t.text     "referrer"
    t.text     "params"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "impressions", ["controller_name", "action_name", "ip_address"], name: "controlleraction_ip_index", using: :btree
  add_index "impressions", ["controller_name", "action_name", "request_hash"], name: "controlleraction_request_index", using: :btree
  add_index "impressions", ["controller_name", "action_name", "session_hash"], name: "controlleraction_session_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "ip_address"], name: "poly_ip_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "params"], name: "poly_params_request_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "request_hash"], name: "poly_request_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "session_hash"], name: "poly_session_index", using: :btree
  add_index "impressions", ["impressionable_type", "message", "impressionable_id"], name: "impressionable_type_message_index", using: :btree
  add_index "impressions", ["user_id"], name: "index_impressions_on_user_id", using: :btree

  create_table "peegins", force: :cascade do |t|
    t.string   "title"
    t.string   "meaning"
    t.string   "example"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "permalink"
    t.integer  "user_id"
    t.integer  "cached_votes_total",      default: 0
    t.integer  "cached_votes_score",      default: 0
    t.integer  "cached_votes_up",         default: 0
    t.integer  "cached_votes_down",       default: 0
    t.integer  "cached_weighted_score",   default: 0
    t.integer  "cached_weighted_total",   default: 0
    t.float    "cached_weighted_average", default: 0.0
    t.string   "origin"
    t.string   "synonyms"
    t.boolean  "front_page",              default: false
    t.boolean  "word_of_the_day",         default: false
    t.boolean  "basic_phrase",            default: false
    t.boolean  "clean",                   default: true
    t.integer  "impressions_count",       default: 0
  end

  add_index "peegins", ["cached_votes_down"], name: "index_peegins_on_cached_votes_down", using: :btree
  add_index "peegins", ["cached_votes_score"], name: "index_peegins_on_cached_votes_score", using: :btree
  add_index "peegins", ["cached_votes_total"], name: "index_peegins_on_cached_votes_total", using: :btree
  add_index "peegins", ["cached_votes_up"], name: "index_peegins_on_cached_votes_up", using: :btree
  add_index "peegins", ["cached_weighted_average"], name: "index_peegins_on_cached_weighted_average", using: :btree
  add_index "peegins", ["cached_weighted_score"], name: "index_peegins_on_cached_weighted_score", using: :btree
  add_index "peegins", ["cached_weighted_total"], name: "index_peegins_on_cached_weighted_total", using: :btree
  add_index "peegins", ["user_id"], name: "index_peegins_on_user_id", using: :btree

  create_table "searchjoy_searches", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "search_type"
    t.string   "query"
    t.string   "normalized_query"
    t.integer  "results_count"
    t.datetime "created_at"
    t.integer  "convertable_id"
    t.string   "convertable_type"
    t.datetime "converted_at"
  end

  add_index "searchjoy_searches", ["convertable_id", "convertable_type"], name: "index_searchjoy_searches_on_convertable_id_and_convertable_type", using: :btree
  add_index "searchjoy_searches", ["created_at"], name: "index_searchjoy_searches_on_created_at", using: :btree
  add_index "searchjoy_searches", ["search_type", "created_at"], name: "index_searchjoy_searches_on_search_type_and_created_at", using: :btree
  add_index "searchjoy_searches", ["search_type", "normalized_query", "created_at"], name: "index_searchjoy_searches_on_search_type_normalized_query", using: :btree

  create_table "sessions", force: :cascade do |t|
    t.string   "ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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
    t.string   "name"
    t.boolean  "admin"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "votes", force: :cascade do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope", using: :btree
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope", using: :btree

end
