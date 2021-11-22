class Ability < ApplicationRecord
  has_many :pokemons_abilities, :class_name => 'PokemonAbility'
  has_many :pokemons, :through => :pokemons_abilities

  validates_presence_of :name
  validates_uniqueness_of :name
end
