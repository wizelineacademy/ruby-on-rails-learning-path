class Pokemon < ApplicationRecord
    has_many :abilities_pokemons
    has_many :games_pokemons
    has_and_belongs_to_many :moves
    has_many :pokemons_stats
    has_and_belongs_to_many :types
    has_one :form
    has_many :sprites
    has_and_belongs_to_many :maestros
end
