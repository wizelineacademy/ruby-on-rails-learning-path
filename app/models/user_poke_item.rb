class UserPokeItem < ApplicationRecord
    belongs_to :poke_item
    belongs_to :user
end
