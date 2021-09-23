class PokeItem < ApplicationRecord
    has_many :user_poke_items
    has_many :users, through: :user_poke_items
    validates :external_id, uniqueness: true
end
