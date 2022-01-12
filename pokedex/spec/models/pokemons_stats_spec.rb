require 'rails_helper'
require 'rspec/rails'
require 'shoulda-matchers'

RSpec.describe PokemonsStat, :type => :model do
  describe 'associations' do
    it { should belong_to(:stat) }
    it { should belong_to(:pokemon) }
  end
end