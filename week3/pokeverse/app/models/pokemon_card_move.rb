class PokemonCardMove < ApplicationRecord

    belongs_to :pokemon_card
    belongs_to :move
    belongs_to :type, optional: true

    COST_VALUES = [0, 1, 2, 3, 4]

    validates_inclusion_of :is_ability, :in => [true, false], 
        :message => "must be true or false"

    scope :ability, lambda { where(:is_ability => true) }

    def self.cost_values
        COST_VALUES
    end

end
