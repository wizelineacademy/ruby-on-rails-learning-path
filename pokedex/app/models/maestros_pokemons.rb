class MaestrosPokemons < ApplicationRecord
    belongs_to :maestro
    belongs_to :pokemon

    scope :sorted, lambda { order("level DESC") }
end
