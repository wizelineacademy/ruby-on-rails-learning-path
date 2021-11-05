class CreateMovesPokemonsJoin < ActiveRecord::Migration[6.1]
  def up
    create_table :moves_pokemons do |t|
      t.integer "pokemon_id"
      t.integer "move_id"
      t.timestamps
    end
    add_index("moves_pokemons", ["pokemon_id", "move_id"])
  end

  def down
    drop_table :moves_pokemons
  end
end
