require 'rails_helper'

RSpec.describe PokemonCardToken, type: :model do
    
    it { should belong_to(:pokemon_card) }
    it { should belong_to(:type) }
    
end