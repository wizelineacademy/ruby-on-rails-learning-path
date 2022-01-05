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

ActiveRecord::Schema.define(version: 2021_09_13_124228) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "moves", force: :cascade do |t|
    t.integer "pokeapi_id"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "description", limit: 150
    t.index ["name"], name: "index_moves_on_name"
    t.index ["pokeapi_id"], name: "index_moves_on_pokeapi_id"
  end

  create_table "pokemon_card_moves", force: :cascade do |t|
    t.integer "pokemon_card_id"
    t.integer "move_id"
    t.integer "cost", default: 1, null: false
    t.integer "type_id"
    t.boolean "is_ability", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "description", limit: 200
    t.index ["move_id"], name: "index_pokemon_card_moves_on_move_id"
    t.index ["pokemon_card_id"], name: "index_pokemon_card_moves_on_pokemon_card_id"
  end

  create_table "pokemon_card_tokens", force: :cascade do |t|
    t.integer "pokemon_card_id"
    t.integer "type_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pokemon_card_id"], name: "index_pokemon_card_tokens_on_pokemon_card_id"
    t.index ["type_id"], name: "index_pokemon_card_tokens_on_type_id"
  end

  create_table "pokemon_cards", force: :cascade do |t|
    t.integer "pokemon_id"
    t.integer "defense", default: 1, null: false
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pokemon_id"], name: "index_pokemon_cards_on_pokemon_id"
    t.index ["user_id"], name: "index_pokemon_cards_on_user_id"
  end

  create_table "pokemon_moves", id: false, force: :cascade do |t|
    t.integer "pokemon_id"
    t.integer "move_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pokemon_id", "move_id"], name: "index_pokemon_moves_on_pokemon_id_and_move_id"
  end

  create_table "pokemons", force: :cascade do |t|
    t.integer "pokeapi_id"
    t.string "name"
    t.string "image_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_pokemons_on_name"
    t.index ["pokeapi_id"], name: "index_pokemons_on_pokeapi_id"
  end

  create_table "types", force: :cascade do |t|
    t.string "color", default: "blue", null: false
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_types", force: :cascade do |t|
    t.string "user_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", limit: 50
    t.string "last_name", limit: 50
    t.string "username", limit: 25
    t.string "email", limit: 100, default: "", null: false
    t.string "password_digest"
    t.integer "user_type_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["username"], name: "index_users_on_username"
  end

end
