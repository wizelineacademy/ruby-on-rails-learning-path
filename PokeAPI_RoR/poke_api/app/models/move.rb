class Move < ApplicationRecord
  belongs_to :pokemon, optional: false
  has_many :users, through: :pokemons
end
