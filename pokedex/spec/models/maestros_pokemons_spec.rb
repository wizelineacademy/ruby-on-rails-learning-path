require 'rails_helper'
require 'rspec/rails'
require 'shoulda-matchers'

RSpec.describe MaestrosPokemons, :type => :model do
  describe 'associations' do
    it { should belong_to(:maestro) }
    it { should belong_to(:pokemon) }
  end
end