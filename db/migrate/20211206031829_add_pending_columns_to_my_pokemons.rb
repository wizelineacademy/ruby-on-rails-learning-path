class AddPendingColumnsToMyPokemons < ActiveRecord::Migration[6.1]
  def change
    add_column :my_pokemons, :name, :string 
    add_column :my_pokemons, :abilities, :json    
    add_column :my_pokemons, :base_experience, :integer
    add_column :my_pokemons, :forms, :json
    add_column :my_pokemons, :game_indices, :json
    add_column :my_pokemons, :height, :integer
    add_column :my_pokemons, :held_items, :json
    add_column :my_pokemons, :pokemon_api, :integer
    add_column :my_pokemons, :is_default, :boolean
    add_column :my_pokemons, :location_area_encounters, :json
    add_column :my_pokemons, :moves, :json
    add_column :my_pokemons, :order, :json
    add_column :my_pokemons, :past_types, :json
    add_column :my_pokemons, :species, :json
    add_column :my_pokemons, :sprites, :json
    add_column :my_pokemons, :stats, :json
    add_column :my_pokemons, :types, :json
    add_column :my_pokemons, :weight, :integer
end
end
