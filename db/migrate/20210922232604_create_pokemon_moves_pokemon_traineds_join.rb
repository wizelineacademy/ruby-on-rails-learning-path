class CreatePokemonMovesPokemonTrainedsJoin < ActiveRecord::Migration[6.1]
  def change
    create_table :pokemon_moves_traineds, id: false do |t|
      t.belongs_to :pokemon_trained
      t.belongs_to :pokemon_move
    end
  end
end
