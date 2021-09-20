class Move < ApplicationRecord

    has_and_belongs_to_many :pokemons, :join_table => :pokemon_moves
    has_many :pokemon_card_moves

    validates :pokeapi_id, :presence => true,
                           :uniqueness => true

    validates :name, :presence => true,
                     :uniqueness => true

    scope :sorted, lambda { order("name ASC") }
end
