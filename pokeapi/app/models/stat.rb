class Stat < ApplicationRecord

    has_many :pokemons, :through => :pokemons_stats
    
end
