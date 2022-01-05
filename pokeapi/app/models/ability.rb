class Ability < ApplicationRecord

    has_many :pokemon_abilities, :class_name => 'PokemonAbility'
    has_many :pokemons, :through => :pokemon_abilities
    

end
