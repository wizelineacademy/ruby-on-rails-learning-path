class PokeItem < ApplicationRecord
    validates :external_id, uniqueness: true
end
