class User < ApplicationRecord
    has_many :pokemon_traineds
    has_many :user_poke_items
    has_many :pokemons, through: :pokemon_traineds
    has_many :poke_items, through: :user_poke_items
    has_secure_password
    validates :email, uniqueness: true
    validates :user_name, uniqueness: true
end
