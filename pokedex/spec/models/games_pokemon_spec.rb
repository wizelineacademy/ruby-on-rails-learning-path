require 'rails_helper'
require 'rspec/rails'
require 'shoulda-matchers'

RSpec.describe GamesPokemon, :type => :model do
  describe 'associations' do
    it { should belong_to(:game) }
    it { should belong_to(:pokemon) }
  end
end