class UserPokeItem < ApplicationRecord
    has_many :user_poke_items
    has_many :users, through: :user_poke_items
    
end
