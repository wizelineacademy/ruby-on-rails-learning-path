class Stat < ApplicationRecord
    has_many :pokemons_stats
    has_many :pokemons, :through => :pokemons_stats
    
    scope :sorted, lambda { order("id ASC") }
    scope :newest_first, lambda { order("created_at DESC") }
    scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"]) }
end
