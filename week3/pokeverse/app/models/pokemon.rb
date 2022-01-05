class Pokemon < ApplicationRecord

    has_and_belongs_to_many :moves, :join_table => :pokemon_moves
    has_many :pokemon_cards

    MAX_POKEMON = 898

    validates :pokeapi_id, :presence => true,
                           :uniqueness => true

    validates :name, :presence => true,
                     :uniqueness => true

    scope :sorted, lambda { order("pokeapi_id ASC") }
    scope :sorted_by_name, lambda { order("name ASC") }

    def self.max_pokemon
        MAX_POKEMON
    end
end
