class PokemonTrainer < ApplicationRecord
  has_and_belongs_to_many :pokemon_cards
  belongs_to :player
end
