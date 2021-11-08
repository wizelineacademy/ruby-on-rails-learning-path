class GamesPokemon < ApplicationRecord
    belongs_to :pokemon
    belongs_to :game
end
