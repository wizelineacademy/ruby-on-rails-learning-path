class Type < ApplicationRecord

    has_many :pokemon_card_moves
    has_many :pokemon_card_tokens

    TYPE_COLORS = ["blue", "red", "grey", "yellow"]

    validates_presence_of :color
    
    validates_inclusion_of :color, :in => TYPE_COLORS, 
        :message => "must be one of #{TYPE_COLORS.join(', ')}"

    scope :blue, lambda {where(:color => "blue").first}
    scope :red, lambda {where(:color => "red").first}
    scope :gray, lambda {where(:color => "gray").first}
    scope :yellow, lambda {where(:color => "yellow").first}

    def self.type_colors 
        TYPE_COLORS
    end
end
