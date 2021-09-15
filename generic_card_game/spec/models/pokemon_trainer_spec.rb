require 'rails_helper'

RSpec.describe PokemonTrainer, :type => :model do
  let(:name) { "PokemonTrainer" }

  def subject
    @player = Player.new(email: 'test@somewhere.com', password: 'secret')
    @player.save
    PokemonTrainer.new(name: 'Lonin', player: @player)
  end

  it {is_expected.to respond_to(:player, :name, :pokemon_cards)}

  it 'should not be valid without a player assigned'do
    trainer = PokemonTrainer.new(name: 'Test')
    expect(trainer).not_to be_valid
  end

  it 'should be valid with player assigned' do
    is_expected.to be_valid
  end

end