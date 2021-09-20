require 'rails_helper'

RSpec.describe Pokemon, type: :model do
    
    it { should have_many(:pokemon_cards) }
    it { should have_and_belong_to_many(:moves) }
    it { should validate_presence_of(:pokeapi_id) }
    it { should validate_presence_of(:name) }
    
end