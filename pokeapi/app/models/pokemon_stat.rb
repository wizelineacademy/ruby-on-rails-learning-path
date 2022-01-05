class PokemonStat < ApplicationRecord
    belongs_to :pokemon
    belongs_to :stat
end
