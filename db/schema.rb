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

ActiveRecord::Schema.define(version: 2021_09_22_001056) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "poke_items", force: :cascade do |t|
    t.integer "external_id", null: false
    t.string "name", null: false
    t.string "effect_description", null: false
    t.boolean "is_pokeball", default: false, null: false
    t.boolean "is_potion", default: false, null: false
    t.string "image_route"
    t.integer "healing_hp", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pokemon_moves", force: :cascade do |t|
    t.integer "external_id", null: false
    t.string "name", null: false
    t.integer "accuracy", null: false
    t.integer "power", null: false
    t.string "descriptive_name", null: false
    t.string "effect_description", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pokemon_trained_pokemon_moves", force: :cascade do |t|
    t.bigint "pokemon_trained_id"
    t.bigint "pokemon_move_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pokemon_move_id"], name: "index_pokemon_trained_pokemon_moves_on_pokemon_move_id"
    t.index ["pokemon_trained_id"], name: "index_pokemon_trained_pokemon_moves_on_pokemon_trained_id"
  end

  create_table "pokemon_traineds", force: :cascade do |t|
    t.string "custom_name"
    t.bigint "user_id"
    t.bigint "pokemon_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pokemon_id"], name: "index_pokemon_traineds_on_pokemon_id"
    t.index ["user_id"], name: "index_pokemon_traineds_on_user_id"
  end

  create_table "pokemons", force: :cascade do |t|
    t.integer "external_id"
    t.string "name", null: false
    t.string "image_route"
    t.boolean "is_custom", default: false, null: false
    t.integer "base_hp", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_pokemons_on_name"
  end

  create_table "user_poke_items", force: :cascade do |t|
    t.integer "quantity", default: 0
    t.bigint "user_id"
    t.bigint "poke_item_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["poke_item_id"], name: "index_user_poke_items_on_poke_item_id"
    t.index ["user_id"], name: "index_user_poke_items_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["user_name"], name: "index_users_on_user_name"
  end

end
