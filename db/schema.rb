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

ActiveRecord::Schema.define(version: 2020_09_26_090319) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "cities", force: :cascade do |t|
    t.string "name", null: false
    t.string "code", null: false
    t.integer "prefecture_id", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["code"], name: "index_cities_on_code", unique: true
  end

  create_table "comments", force: :cascade do |t|
    t.string "name", default: "名無しさん", null: false
    t.string "content", null: false
    t.boolean "is_complete", default: false
    t.bigint "shop_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shop_id"], name: "index_comments_on_shop_id"
  end

  create_table "congrestion_infos", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "main_shops", force: :cascade do |t|
    t.string "name", null: false
    t.string "eng_name", null: false
    t.string "image", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "logo", default: "", comment: "ロゴ画像"
  end

  create_table "near_station_relationships", force: :cascade do |t|
    t.integer "main_station_id", null: false
    t.integer "near_station_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["main_station_id", "near_station_id"], name: "index_main_station_and_near_station", unique: true
    t.index ["main_station_id"], name: "index_near_station_relationships_on_main_station_id"
    t.index ["near_station_id"], name: "index_near_station_relationships_on_near_station_id"
  end

  create_table "shop_congrestion_infos", force: :cascade do |t|
    t.bigint "shop_id"
    t.bigint "congrestion_info_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["congrestion_info_id"], name: "index_shop_congrestion_infos_on_congrestion_info_id"
    t.index ["shop_id"], name: "index_shop_congrestion_infos_on_shop_id"
  end

  create_table "shop_stations", force: :cascade do |t|
    t.bigint "shop_id", null: false
    t.bigint "station_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shop_id"], name: "index_shop_stations_on_shop_id"
    t.index ["station_id"], name: "index_shop_stations_on_station_id"
  end

  create_table "shops", force: :cascade do |t|
    t.string "name", null: false
    t.string "prefecture_name", null: false
    t.string "city_name", null: false
    t.string "other_address", null: false
    t.text "access"
    t.string "tel"
    t.text "business_hour"
    t.string "chair"
    t.string "hp"
    t.boolean "wifi", default: false
    t.boolean "socket", default: false
    t.boolean "smoking", default: false
    t.boolean "iccard", default: false
    t.decimal "lat", precision: 10, scale: 7, null: false
    t.decimal "lng", precision: 11, scale: 7, null: false
    t.boolean "is_open", default: true, null: false
    t.bigint "main_shop_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "prefecture_id", default: 0, null: false
    t.bigint "city_id"
    t.index ["city_id"], name: "index_shops_on_city_id"
    t.index ["main_shop_id"], name: "index_shops_on_main_shop_id"
  end

  create_table "stations", force: :cascade do |t|
    t.string "kanji_name", null: false
    t.string "kana_name", null: false
    t.bigint "city_id"
    t.integer "prefecture_id", default: 48, null: false
    t.datetime "created_at", default: "2020-09-23 11:19:02", null: false
    t.datetime "updated_at", default: "2020-09-23 11:19:02", null: false
    t.index ["city_id"], name: "index_stations_on_city_id"
  end

  add_foreign_key "comments", "shops"
  add_foreign_key "shop_congrestion_infos", "congrestion_infos"
  add_foreign_key "shop_congrestion_infos", "shops"
  add_foreign_key "shop_stations", "shops"
  add_foreign_key "shop_stations", "stations"
  add_foreign_key "shops", "cities"
  add_foreign_key "shops", "main_shops"
  add_foreign_key "stations", "cities"
end
