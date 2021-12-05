class AddPendingColumnsOnPokemons < ActiveRecord::Migration[6.1]
  def change
      add_column :pokemons, :abilities, :json    
      add_column :pokemons, :base_experience, :integer
      add_column :pokemons, :forms, :json
      add_column :pokemons, :game_indices, :json
      add_column :pokemons, :height, :integer
      add_column :pokemons, :held_items, :json
      add_column :pokemons, :pokemon_api, :integer
      add_column :pokemons, :is_default, :boolean
      add_column :pokemons, :location_area_encounters, :json
      add_column :pokemons, :moves, :json
      add_column :pokemons, :order, :json
      add_column :pokemons, :past_types, :json
      add_column :pokemons, :species, :json
      add_column :pokemons, :sprites, :json
      add_column :pokemons, :stats, :json
      add_column :pokemons, :types, :json
      add_column :pokemons, :weight, :integer
end
end