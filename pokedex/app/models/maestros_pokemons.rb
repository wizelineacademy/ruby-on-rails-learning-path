class MaestrosPokemons < ApplicationRecord
    belongs_to :maestro
    belongs_to :pokemon
end
