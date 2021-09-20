require 'rails_helper'

RSpec.describe PokemonCard, type: :model do
    
    it { should have_many(:pokemon_card_moves).dependent(:destroy) }
    it { should have_many(:pokemon_card_tokens).dependent(:destroy) }
    it { should validate_presence_of(:defense) }
    it { should validate_inclusion_of(:defense).in_array(PokemonCard.defense_values) }
    
end