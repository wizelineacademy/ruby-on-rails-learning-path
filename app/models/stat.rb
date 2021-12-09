class Stat < ApplicationRecord
  has_many :pokemons_stats, :class_name => 'PokemonStat'
  has_many :pokemons, :through => :pokemons_stats
end
