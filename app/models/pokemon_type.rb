class PokemonType < ApplicationRecord
  self.table_name = "pokemons_types"

  belongs_to :pokemon
  belongs_to :type
end
