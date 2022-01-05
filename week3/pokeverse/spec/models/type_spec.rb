require 'rails_helper'

RSpec.describe Type, type: :model do
    
    it { should have_many(:pokemon_card_moves) }
    it { should have_many(:pokemon_card_tokens) }
    it { should validate_presence_of(:color) }
    it { should validate_inclusion_of(:color).in_array(Type.type_colors).with_message("must be one of #{Type.type_colors.join(', ')}") }
    
end