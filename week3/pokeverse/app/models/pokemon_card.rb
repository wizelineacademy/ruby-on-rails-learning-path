class PokemonCard < ApplicationRecord

    belongs_to :pokemon
    belongs_to :user
    has_many :pokemon_card_moves, dependent: :destroy
    has_many :pokemon_card_tokens, dependent: :destroy

    accepts_nested_attributes_for :pokemon_card_moves, :pokemon_card_tokens

    DEFENSE_VALUES = [1, 2]
    NUMBER_OF_MOVES = 3
    NUMBER_OF_TOKENS = 2

    validates :defense, :presence => true,
                        :inclusion => {:in => DEFENSE_VALUES}
    
    scope :sorted, lambda { order("created_at ASC") }

    def self.defense_values
        DEFENSE_VALUES
    end

    def self.number_of_moves
        NUMBER_OF_MOVES
    end

    def self.number_of_tokens
        NUMBER_OF_TOKENS
    end
end
