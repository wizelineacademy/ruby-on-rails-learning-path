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

ActiveRecord::Schema.define(version: 2021_11_05_185203) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "abilities", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ability_pokemons", force: :cascade do |t|
    t.integer "pokemon_id"
    t.integer "ability_id"
    t.boolean "is_hidden", default: true
    t.integer "slot"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pokemon_id", "ability_id"], name: "index_ability_pokemons_on_pokemon_id_and_ability_id"
  end

  create_table "forms", force: :cascade do |t|
    t.integer "pokemon_id"
    t.string "name"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pokemon_id"], name: "index_forms_on_pokemon_id"
  end

  create_table "game_pokemons", force: :cascade do |t|
    t.integer "pokemon_id"
    t.integer "game_id"
    t.integer "game_index"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pokemon_id", "game_id"], name: "index_game_pokemons_on_pokemon_id_and_game_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "maestros", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "region"
    t.string "hometown"
    t.string "picture"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "moves", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "moves_pokemons", force: :cascade do |t|
    t.integer "pokemon_id"
    t.integer "move_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pokemon_id", "move_id"], name: "index_moves_pokemons_on_pokemon_id_and_move_id"
  end

  create_table "pokemon_stats", force: :cascade do |t|
    t.integer "pokemon_id"
    t.integer "stat_id"
    t.integer "base_stat"
    t.integer "effort"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pokemon_id", "stat_id"], name: "index_pokemon_stats_on_pokemon_id_and_stat_id"
  end

  create_table "pokemons", force: :cascade do |t|
    t.integer "height"
    t.integer "pokedex_id", null: false
    t.boolean "is_default", default: true
    t.string "location_area_encounters"
    t.string "name", limit: 40, null: false
    t.integer "order"
    t.integer "weight"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pokemons_types", force: :cascade do |t|
    t.integer "pokemon_id"
    t.integer "type_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pokemon_id", "type_id"], name: "index_pokemons_types_on_pokemon_id_and_type_id"
  end

  create_table "sprites", force: :cascade do |t|
    t.integer "pokemon_id"
    t.string "back_default"
    t.string "back_female"
    t.string "back_shiny"
    t.string "back_shiny_female"
    t.string "front_default"
    t.string "front_female"
    t.string "front_shiny"
    t.string "front_shiny_female"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pokemon_id"], name: "index_sprites_on_pokemon_id"
  end

  create_table "stats", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "teams", force: :cascade do |t|
    t.integer "pokemon_id"
    t.integer "maestro_id"
    t.string "name"
    t.integer "level"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pokemon_id", "maestro_id"], name: "index_teams_on_pokemon_id_and_maestro_id"
  end

  create_table "types", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
