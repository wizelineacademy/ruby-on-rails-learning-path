class Ability < ApplicationRecord
  has_many :pokemons_abilities, :class_name => 'PokemonAbility'
  has_many :pokemons, :through => :pokemons_abilities

  validates :name, :presence => true, :uniqueness => { case_sensitive: false }
end
