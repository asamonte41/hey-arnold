# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_11_08_153321) do
  create_table "appearances", force: :cascade do |t|
    t.integer "character_id", null: false
    t.integer "episode_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_appearances_on_character_id"
    t.index ["episode_id"], name: "index_appearances_on_episode_id"
  end

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.string "role"
    t.text "description"
    t.string "image_url"
    t.integer "location_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_characters_on_location_id"
  end

  create_table "episodes", force: :cascade do |t|
    t.string "title"
    t.integer "season"
    t.integer "episode_number"
    t.date "air_date"
    t.text "synopsis"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quotes", force: :cascade do |t|
    t.string "text"
    t.integer "character_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "episode_id", null: false
    t.index ["character_id"], name: "index_quotes_on_character_id"
    t.index ["episode_id"], name: "index_quotes_on_episode_id"
  end

  create_table "solid_cable_messages", force: :cascade do |t|
    t.binary "channel", limit: 1024, null: false
    t.binary "payload", limit: 536870912, null: false
    t.datetime "created_at", null: false
    t.integer "channel_hash", limit: 8, null: false
    t.index ["channel"], name: "index_solid_cable_messages_on_channel"
    t.index ["channel_hash"], name: "index_solid_cable_messages_on_channel_hash"
    t.index ["created_at"], name: "index_solid_cable_messages_on_created_at"
  end

  add_foreign_key "appearances", "characters"
  add_foreign_key "appearances", "episodes"
  add_foreign_key "characters", "locations"
  add_foreign_key "quotes", "characters"
  add_foreign_key "quotes", "episodes"
end
