class Ability < ApplicationRecord

    has_many :pokemon_abilities, :class_name => 'PokemonAbility'
    has_many :pokemons, :through => :pokemon_abilities
    
    scope :sorted, lambda { order("id ASC") }
    scope :newest_first, lambda { order("created_at DESC") }
    scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"]) }

    validates_presence_of :name
    validates_length_of :name, :maximum => 255
    validates_uniqueness_of :ability_id
end
