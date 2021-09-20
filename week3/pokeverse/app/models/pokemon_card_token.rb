class PokemonCardToken < ApplicationRecord

    belongs_to :pokemon_card
    belongs_to :type

end
