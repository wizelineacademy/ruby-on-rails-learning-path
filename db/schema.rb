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

ActiveRecord::Schema.define(version: 2021_11_18_214957) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "abilities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pokemons", force: :cascade do |t|
    t.string "name", null: false
    t.string "sprite"
    t.integer "base_experience", default: 0
    t.integer "height", null: false
    t.boolean "is_default", default: false
    t.integer "order"
    t.integer "weight", null: false
    t.integer "hp", null: false
    t.integer "attack", null: false
    t.integer "defense", null: false
    t.integer "special_attack", null: false
    t.integer "special_defense", null: false
    t.integer "speed", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pokemons_abilities", id: false, force: :cascade do |t|
    t.integer "ability_id"
    t.integer "pokemon_id"
    t.boolean "is_hidden"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ability_id", "pokemon_id"], name: "index_pokemons_abilities_on_ability_id_and_pokemon_id"
  end

  create_table "pokemons_types", id: false, force: :cascade do |t|
    t.integer "pokemon_id"
    t.integer "type_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pokemon_id", "type_id"], name: "index_pokemons_types_on_pokemon_id_and_type_id"
  end

  create_table "types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", limit: 25, null: false
    t.string "last_name", limit: 50, null: false
    t.string "email", limit: 100, null: false
    t.string "username", limit: 25, null: false
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
