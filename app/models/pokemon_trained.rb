class PokemonTrained < ApplicationRecord
    has_and_belongs_to_many :pokemon_moves
    belongs_to :pokemon
    belongs_to :user
end
