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

ActiveRecord::Schema.define(version: 2021_11_05_212159) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "abilities", force: :cascade do |t|
    t.string "name", limit: 30, null: false
    t.string "url", limit: 40, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "abilities_pokemons", force: :cascade do |t|
    t.integer "pokemon_id", null: false
    t.integer "ability_id", null: false
    t.boolean "is_hidden", default: true
    t.integer "slot", default: 1
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pokemon_id", "ability_id"], name: "index_abilities_pokemons_on_pokemon_id_and_ability_id"
  end

  create_table "forms", force: :cascade do |t|
    t.integer "pokemon_id", null: false
    t.string "name", limit: 40, null: false
    t.string "url", limit: 50, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pokemon_id"], name: "index_forms_on_pokemon_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "name", limit: 20, null: false
    t.string "url", limit: 40, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "games_pokemons", force: :cascade do |t|
    t.integer "pokemon_id", null: false
    t.integer "game_id", null: false
    t.integer "game_index", default: 1
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pokemon_id", "game_id"], name: "index_games_pokemons_on_pokemon_id_and_game_id"
  end

  create_table "maestros", force: :cascade do |t|
    t.string "name", limit: 30, null: false
    t.string "email", limit: 50, null: false
    t.string "region", limit: 30
    t.string "hometown", limit: 30
    t.string "picture", limit: 100
    t.string "password_digest", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "maestros_pokemons", force: :cascade do |t|
    t.integer "pokemon_id", null: false
    t.integer "maestro_id", null: false
    t.integer "level", default: 1, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pokemon_id", "maestro_id"], name: "index_maestros_pokemons_on_pokemon_id_and_maestro_id"
  end

  create_table "moves", force: :cascade do |t|
    t.string "name", limit: 40, null: false
    t.string "url", limit: 40, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "moves_pokemons", force: :cascade do |t|
    t.integer "pokemon_id", null: false
    t.integer "move_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pokemon_id", "move_id"], name: "index_moves_pokemons_on_pokemon_id_and_move_id"
  end

  create_table "pokemons", force: :cascade do |t|
    t.integer "height", default: 1
    t.integer "pokedex_id", null: false
    t.boolean "is_default", default: true
    t.string "location_area_encounters", limit: 50
    t.string "name", limit: 40, null: false
    t.integer "order", default: 1
    t.integer "weight", default: 1
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pokemons_stats", force: :cascade do |t|
    t.integer "pokemon_id", null: false
    t.integer "stat_id", null: false
    t.integer "base_stat", default: 1
    t.integer "effort", default: 1
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pokemon_id", "stat_id"], name: "index_pokemons_stats_on_pokemon_id_and_stat_id"
  end

  create_table "pokemons_types", force: :cascade do |t|
    t.integer "pokemon_id", null: false
    t.integer "type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pokemon_id", "type_id"], name: "index_pokemons_types_on_pokemon_id_and_type_id"
  end

  create_table "sprites", force: :cascade do |t|
    t.integer "pokemon_id", null: false
    t.string "back_default", limit: 100, null: false
    t.string "back_female", limit: 100
    t.string "back_shiny", limit: 100
    t.string "back_shiny_female", limit: 100
    t.string "front_default", limit: 100, null: false
    t.string "front_female", limit: 100
    t.string "front_shiny", limit: 100
    t.string "front_shiny_female", limit: 100
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pokemon_id"], name: "index_sprites_on_pokemon_id"
  end

  create_table "stats", force: :cascade do |t|
    t.string "name", limit: 20, null: false
    t.string "url", limit: 40, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "types", force: :cascade do |t|
    t.string "name", limit: 40, null: false
    t.string "url", limit: 40, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
