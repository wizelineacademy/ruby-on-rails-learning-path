class CreateGamePokemons < ActiveRecord::Migration[6.1]
  def up
    create_table :game_pokemons do |t|
      t.integer "pokemon_id"
      t.integer "game_id"
      t.integer "game_index"
      t.timestamps
    end
    add_index("game_pokemons", ["pokemon_id", "game_id"])
  end

  def down
    drop_table :game_pokemons
  end
end