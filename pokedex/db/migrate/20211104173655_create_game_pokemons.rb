class CreateGamePokemons < ActiveRecord::Migration[6.1]
  def up
    create_table :games_pokemons do |t|
      t.integer "pokemon_id"
      t.integer "game_id"
      t.integer "game_index"
      t.timestamps
    end
    add_index("games_pokemons", ["pokemon_id", "game_id"])
  end

  def down
    drop_table :games_pokemons
  end
end