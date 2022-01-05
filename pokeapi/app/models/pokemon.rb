class Pokemon < ApplicationRecord

    has_many :pokemon_abilities, :class_name => 'PokemonAbility'
    has_many :pokemons_stats, :class_name => 'PokemonStat'
    has_and_belongs_to_many :users

end
