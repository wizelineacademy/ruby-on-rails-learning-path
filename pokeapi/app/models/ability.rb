class Ability < ApplicationRecord

    has_many :pokemons, :through => :pokemons_abilities

end
