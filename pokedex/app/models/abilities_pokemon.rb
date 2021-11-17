class AbilitiesPokemon < ApplicationRecord
    belongs_to :ability
    belongs_to :pokemon
end
