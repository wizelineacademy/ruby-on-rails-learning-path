class Move < ApplicationRecord
  # acts_as_list scope: :pokemon
  belongs_to :pokemon, optional: false
  has_many :users, through: :pokemons
end
