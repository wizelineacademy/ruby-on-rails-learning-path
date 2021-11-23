class Pokemon < ApplicationRecord
  has_many :pokemons_abilities, :class_name => 'PokemonAbility'
  has_many :pokemons_types, :class_name => 'PokemonType'
  has_many :abilities, :through => :pokemons_abilities
  has_many :types, :through => :pokemons_types

  validates :name, :presence => true, :uniqueness => { case_sensitive: false }
  validates :height, :presence => true, :numericality => { only_integer: true, greater_than: 0 }
  validates :weight, :presence => true, :numericality => { only_integer: true, greater_than: 0 }
  validates :hp, :presence => true, :numericality => { only_integer: true, greater_than: 0 }
  validates :attack, :presence => true, :numericality => { only_integer: true, greater_than_or_equal_to: 0 }
  validates :defense, :presence => true, :numericality => { only_integer: true, greater_than_or_equal_to: 0 }
  validates :special_attack, :presence => true, :numericality => { only_integer: true, greater_than_or_equal_to: 0 }
  validates :special_defense, :presence => true, :numericality => { only_integer: true, greater_than_or_equal_to: 0 }
  validates :speed, :presence => true, :numericality => { only_integer: true, greater_than_or_equal_to: 0 }
end
