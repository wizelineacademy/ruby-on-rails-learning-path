require 'rails_helper'

RSpec.describe Pokemon, type: :model do
  before :context do
    @pokemon = Pokemon.new
    @pokemon.name = "Taken" 
    @pokemon.is_custom = true
    @pokemon.base_hp = 1
    @pokemon.save
  end
  context "pokemon required fields" do
    it "must have a name and base_hp" do
      pokemonC = Pokemon.new 
      pokemonC.is_custom = true
      expect{pokemonC.save}.to raise_error(ActiveRecord::NotNullViolation)
    end
  end
  context "pokemon unique fields" do
    it "must have a unique name" do
      pokemonC = Pokemon.new
      pokemonC.name = "Taken" 
      pokemonC.is_custom = true
      pokemonC.base_hp = 1
      expect(pokemonC.save).to be_falsy
    end
  end
end
