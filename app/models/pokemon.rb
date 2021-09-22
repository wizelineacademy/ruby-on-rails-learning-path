class Pokemon < ApplicationRecord
    has_many :pokemon_traineds
    validates :name, uniqueness: true
end
