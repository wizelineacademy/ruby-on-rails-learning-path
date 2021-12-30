class PokemonStat < ApplicationRecord
    self.table_name = "pokemons_stats"

    belongs_to :pokemon
    belongs_to :stat
end
