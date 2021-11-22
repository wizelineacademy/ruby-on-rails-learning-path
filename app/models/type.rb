class Type < ApplicationRecord
  has_many :pokemons_types, :class_name => 'PokemonType'
  has_many :pokemons, :through => :pokemons_types

  validates_presence_of :name
  validates_uniqueness_of :name
end
