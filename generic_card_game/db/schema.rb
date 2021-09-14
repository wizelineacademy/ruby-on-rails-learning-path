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

ActiveRecord::Schema.define(version: 2021_09_14_172628) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.string "session_id"
    t.integer "room_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.string "email", null: false
    t.index ["email"], name: "index_players_on_email", unique: true
  end

  create_table "pokemon_cards", force: :cascade do |t|
    t.string "card_id"
    t.string "name"
    t.string "rarity"
    t.string "supertype"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image"
    t.string "image_thumbnail"
  end

  create_table "pokemon_cards_trainers", force: :cascade do |t|
    t.bigint "pokemon_trainer_id", null: false
    t.bigint "pokemon_card_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pokemon_card_id"], name: "index_pokemon_cards_trainers_on_pokemon_card_id"
    t.index ["pokemon_trainer_id"], name: "index_pokemon_cards_trainers_on_pokemon_trainer_id"
  end

  create_table "pokemon_trainers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "player_id", null: false
    t.index ["player_id"], name: "index_pokemon_trainers_on_player_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "uuid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "pokemon_cards_trainers", "pokemon_cards"
  add_foreign_key "pokemon_cards_trainers", "pokemon_trainers"
end
