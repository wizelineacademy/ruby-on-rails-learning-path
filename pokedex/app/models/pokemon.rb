class Pokemon < ApplicationRecord
    has_and_belongs_to_many :abilities
    has_and_belongs_to_many :games
    has_and_belongs_to_many :moves
    has_and_belongs_to_many :stats
    has_and_belongs_to_many :types
    has_one :form
    has_many :sprites
end
