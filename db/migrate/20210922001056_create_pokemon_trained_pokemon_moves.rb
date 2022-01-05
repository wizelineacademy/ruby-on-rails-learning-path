class CreatePokemonTrainedPokemonMoves < ActiveRecord::Migration[6.1]
  def change
    create_table :pokemon_trained_pokemon_moves do |t|
      t.references :pokemon_trained
      t.references :pokemon_move
      t.timestamps
    end
  end
end
