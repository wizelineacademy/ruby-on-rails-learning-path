class Pokemon < ApplicationRecord

    has_many :pokemon_abilities, :class_name => 'PokemonAbility'
    has_many :pokemons_stats, :class_name => 'PokemonStat'
    has_and_belongs_to_many :users

    scope :sorted, lambda { order("id ASC") }
    scope :newest_first, lambda { order("created_at DESC") }
    scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"]) }

end
