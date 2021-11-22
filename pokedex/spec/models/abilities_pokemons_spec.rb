require 'rails_helper'
require 'rspec/rails'
require 'shoulda-matchers'

RSpec.describe AbilitiesPokemon, :type => :model do
  describe 'associations' do
    it { should belong_to(:ability) }
    it { should belong_to(:pokemon) }
  end
end