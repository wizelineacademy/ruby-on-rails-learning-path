class AlterPokemon < ActiveRecord::Migration[7.0]
  def up
    #add_column("pokemons", "img", :string, :limit => 100, :after => "weight")
    #add_column("pokemons", "poke_id", :integer, :unique =>  true)
    #rename_table( "pokemons_abilities","pokemon_abilities")
    #rename_table( "pokemons_stats","pokemon_stats")
    rename_column("pokemons", "poke_id", "pokemon_id")
  end

  def down
    #remove_column("pokemons", "img")
    #remove_column("pokemons", "poke_id")
    #rename_table("pokemon_abilities", "pokemons_abilities")
    #rename_table("pokemon_stats", "pokemons_stats")
    rename_column("pokemons", "pokemon_id", "poke_id")

  end
end
