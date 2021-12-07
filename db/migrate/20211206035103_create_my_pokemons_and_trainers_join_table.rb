class CreateMyPokemonsAndTrainersJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :pokemons, :trainers
  end
end
