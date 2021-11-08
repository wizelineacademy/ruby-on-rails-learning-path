class PokemonsStat < ApplicationRecord
    belongs_to :pokemon
    belongs_to :stat
end
