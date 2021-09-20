require 'rails_helper'

RSpec.describe Move, type: :model do
    
    it { should have_many(:pokemon_card_moves) }
    it { should have_and_belong_to_many(:pokemons) }
    it { should validate_presence_of(:pokeapi_id) }
    it { should validate_presence_of(:name) }
    
end