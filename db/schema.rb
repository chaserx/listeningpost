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

ActiveRecord::Schema.define(version: 20150820022540) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "callbacks", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "body"
    t.string   "url"
    t.uuid     "device_id"
    t.uuid     "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "callbacks", ["device_id"], name: "index_callbacks_on_device_id", using: :btree
  add_index "callbacks", ["user_id"], name: "index_callbacks_on_user_id", using: :btree

  create_table "devices", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "name"
    t.uuid     "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "devices", ["user_id"], name: "index_devices_on_user_id", using: :btree

  create_table "messages", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.text     "body"
    t.uuid     "device_id"
    t.string   "ip_address"
    t.uuid     "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "messages", ["device_id"], name: "index_messages_on_device_id", using: :btree
  add_index "messages", ["user_id"], name: "index_messages_on_user_id", using: :btree

  create_table "users", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "webhooks", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "message_body",                  null: false
    t.uuid     "device_id",                     null: false
    t.string   "url",                           null: false
    t.string   "headers"
    t.string   "access_token"
    t.string   "request_type", default: "POST"
    t.json     "payload"
    t.string   "query"
    t.string   "auth"
    t.uuid     "user_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "webhooks", ["device_id"], name: "index_webhooks_on_device_id", using: :btree
  add_index "webhooks", ["user_id"], name: "index_webhooks_on_user_id", using: :btree

end
