class CreatePokemonMoves < ActiveRecord::Migration[6.1]
  def change
    create_table :pokemon_moves, :id => false do |t|
      t.integer "pokemon_id"
      t.integer "move_id"
      t.timestamps
    end
    add_index("pokemon_moves", ["pokemon_id", "move_id"])
  end
end
