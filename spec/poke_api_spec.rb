require 'rails_helper'
require 'poke_api'

RSpec.describe 'PokeApi' do
  subject { PokeApi.new }

  it "fails when running #get_pokemon" do
    expect { subject.get_pokemon name: '' }.to raise_error(ArgumentError) 
  end
end