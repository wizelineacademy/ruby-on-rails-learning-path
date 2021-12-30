class PokemonAbility < ApplicationRecord
    self.table_name = "pokemons_abilities"

    belongs_to :pokemon
    belongs_to :ability
end
