class CreateMyPokemonsAndTrainersJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :my_pokemons, :trainers
    
  end
end
