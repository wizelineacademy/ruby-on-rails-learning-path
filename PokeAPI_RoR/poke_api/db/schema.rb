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

ActiveRecord::Schema.define(version: 2022_01_10_223914) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "abilities", force: :cascade do |t|
    t.integer "pokemon_id"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pokemon_id"], name: "index_abilities_on_pokemon_id"
  end

  create_table "moves", force: :cascade do |t|
    t.integer "pokemon_id"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pokemon_id"], name: "index_moves_on_pokemon_id"
  end

  create_table "pokemons", force: :cascade do |t|
    t.string "name", limit: 25
    t.string "sprite_link"
    t.integer "base_experience"
    t.integer "height"
    t.integer "weight"
    t.integer "pokedex_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pokemons_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "pokemon_id"
    t.index ["user_id", "pokemon_id"], name: "index_pokemons_users_on_user_id_and_pokemon_id"
  end

  create_table "types", force: :cascade do |t|
    t.integer "pokemon_id"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pokemon_id"], name: "index_types_on_pokemon_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", limit: 25
    t.string "email", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
  end

end
