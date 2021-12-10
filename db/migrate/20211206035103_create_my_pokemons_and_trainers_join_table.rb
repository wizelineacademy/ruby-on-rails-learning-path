# frozen_string_literal: true

# Migrate to create many-to-many relationship between Trainer and MyPokemons
class CreateMyPokemonsAndTrainersJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :pokemons, :trainers
  end
end
