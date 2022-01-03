require './environment.rb'

RSpec.describe Environment::Depot do
  let (:depot){ described_class.new }

  context 'when pack is simple transportation' do
    let(:simple_pack){ depot.packs[:simple_transportation_pack] }

    it 'has simple pack intelligence' do
      expect(simple_pack[:intelligence]).to eq([:cellphone])
    end

    it 'has simple pack items' do
      expect(simple_pack[:items]).to eq([:medipack, :chevy_versa])
    end
  end

  context 'when pack is standard transportation' do
    let(:standard_pack){ depot.packs[:standard_transportation_pack] }

    it 'has standard pack intelligence' do
      expect(standard_pack[:intelligence]).to eq([:cellphone, :antenna])
    end

    it 'has standard pack arsenal' do
      expect(standard_pack[:arsenal]).to eq([:colt_1911])
    end

    it 'has standard pack items' do
      expect(standard_pack[:items]).to eq([:handcuffs, :medipack, :chemistry, :chevy_versa])
    end
  end

  context 'when pack is simple mission pack' do
    let(:simple_pack){ depot.packs[:simple_mission_pack] }

    it 'has simple mission pack intelligence' do
      expect(simple_pack[:intelligence]).to eq([:infopack, :laptop, :cellphone, :antenna])
    end

    it 'has simple mission pack arsenal' do
      expect(simple_pack[:arsenal]).to eq([:colt_1911])
    end

    it 'has simple mission pack items' do
      expect(simple_pack[:items]).to eq([:handcuffs, :medipack, :chemistry, :financial])
    end
  end

  context 'when pack is standard mission pack' do
    let(:standard_pack){ depot.packs[:standard_mission_pack] }

    it 'has simple mission pack intelligence' do
      expect(standard_pack[:intelligence]).to eq([:infopack, :laptop, :cellphone, :antenna])
    end

    it 'has simple mission pack arsenal' do
      expect(standard_pack[:arsenal]).to eq([:remington_870, :colt_1911, :machete, :hatchet])
    end

    it 'has simple mission pack items' do
      expect(standard_pack[:items]).to eq([:handcuffs, :medipack, :chemistry, :financial])
    end
  end
end
