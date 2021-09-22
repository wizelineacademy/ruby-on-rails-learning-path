class PokemonMove < ApplicationRecord
    has_and_belongs_to_many :pokemon_traineds
end
