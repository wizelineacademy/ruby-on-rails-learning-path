class Pokemon < ApplicationRecord
    has_many :pokemon_traineds
    has_many :users, through: :pokemon_traineds
    validates :name, uniqueness: true
end
