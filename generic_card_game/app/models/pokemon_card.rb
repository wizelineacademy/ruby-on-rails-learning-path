class PokemonCard < ApplicationRecord
  has_and_belongs_to_many :pokemon_trainers
end
