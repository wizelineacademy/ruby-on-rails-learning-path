require 'rails_helper'

RSpec.describe 'pokemon', type: :model do
  let(:pokemon) do
    Pokemon.new(id: 1, name: 'test_pokemon', sprite_link: 'link',
                base_experience: 100, height: 100,
                weight: 100, pokedex_id: 250,
                abilities: [Ability.new(id: 1, pokemon_id: 1, name: 'test')],
                moves: [Move.new(id: 1, pokemon_id: 1, name: 'test')],
                types: [Type.new(id: 1, pokemon_id: 1, name: 'test')])
  end

  it 'is valid with valid attributes' do
    expect(pokemon).to be_valid
  end

  it 'is not valid with long name' do
    pokemon.name = (1..26).to_a.join
    expect(pokemon).to_not be_valid
  end

  it 'is not valid with no base xp' do
    pokemon.base_experience = nil
    expect(pokemon).to_not be_valid
  end

  it 'is not valid with no height' do
    pokemon.height = nil
    expect(pokemon).to_not be_valid
  end

  it 'is not valid with no weight' do
    pokemon.weight = nil
    expect(pokemon).to_not be_valid
  end

  it 'is not valid with no pokedex_id' do
    pokemon.pokedex_id = nil
    expect(pokemon).to_not be_valid
  end

  it 'is not valid with no abilities' do
    pokemon.abilities.delete(1)
    expect(pokemon).to_not be_valid
  end

  it 'is not valid with no moves' do
    pokemon.moves.delete(1)
    expect(pokemon).to_not be_valid
  end

  it 'is not valid with no types' do
    pokemon.types.delete(1)
    expect(pokemon).to_not be_valid
  end
end
