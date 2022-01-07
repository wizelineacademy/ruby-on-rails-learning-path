require 'rails_helper'

RSpec.describe PokemonMove, type: :model do
  context "pokemon move required fields" do
    it "must have all fields" do
      expect{PokemonMove.create!}.to raise_error(ActiveRecord::NotNullViolation)
    end
  end
end
