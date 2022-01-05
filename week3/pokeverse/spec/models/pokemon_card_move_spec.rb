require 'rails_helper'

RSpec.describe PokemonCardMove, type: :model do
    
    it { should belong_to(:pokemon_card) }
    it { should belong_to(:move) }
    it { should belong_to(:type).optional }
    
end