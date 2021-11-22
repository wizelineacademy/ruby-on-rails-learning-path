class Pokemon < ApplicationRecord
  has_many :pokemons_abilities, :class_name => 'PokemonAbility'
  has_many :pokemons_types, :class_name => 'PokemonType'
  has_many :abilities, :through => :pokemons_abilities
  has_many :types, :through => :pokemons_types

  validates_presence_of :name, :height, :weight, :hp, :attack, :defense, :special_attack, :special_defense, :speed
  validates_uniqueness_of :name
end
