class Type < ApplicationRecord
  has_many :pokemons_types, :class_name => 'PokemonType'
  has_many :pokemons, :through => :pokemons_types

  validates :name, :presence => true, :uniqueness => { case_sensitive: false }

  scope :sorted, -> { order(:name => :asc) }
end
