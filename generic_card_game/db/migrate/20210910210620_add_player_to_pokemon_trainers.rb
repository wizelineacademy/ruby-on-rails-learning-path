class AddPlayerToPokemonTrainers < ActiveRecord::Migration[6.1]
  def change
    add_reference "pokemon_trainers", "player", :null => false, :unique => true
  end
end
