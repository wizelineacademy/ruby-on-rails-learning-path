require 'rails_helper'

RSpec.describe PokemonCard, :type => :model do
  let(:name) { "PokemonCard" }

  it {is_expected.to respond_to(:card_id, :name, :rarity, :image, :image_thumbnail)}
end