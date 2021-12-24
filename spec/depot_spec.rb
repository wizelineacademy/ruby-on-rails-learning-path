=begin
@depot = Environment::Depot.new
@depot.packs[:simple_transportation_pack][:intelligence] must contain [:cellphone]
@depot.packs[:simple_transportation_pack][:items] must contain [:medipack, :chevy_versa]

@depot.packs[:standard_transportation_pack][:intelligence] must contain [:cellphone, :antenna]
@depot.packs[:standard_transportation_pack][:arsenal] must contain [:colt_1911]
@depot.packs[:standard_transportation_pack][:items] must contain [:handcuffs, :medipack, :chemistry, :chevy_versa]

@depot.packs[:simple_mission_pack][:intelligence] must contain [:infopack, :laptop, :cellphone, :antenna]
@depot.packs[:simple_mission_pack][:arsenal] must contain [:colt_1911]
@depot.packs[:simple_mission_pack][:items] must contain [:handcuffs, :medipack, :chemistry, :financial]

@depot.packs[:standard_mission_pack][:intelligence] must contain [:infopack, :laptop, :cellphone, :antenna]
@depot.packs[:standard_mission_pack][:arsenal] must contain [:remington_870, :colt_1911, :machete, :hatchet]
@depot.packs[:standard_mission_pack][:items] must contain [:handcuffs, :medipack, :chemistry, :financial]
=end

require './environment.rb'

RSpec.describe Environment::Depot do
    let (:depot){ described_class.new }

    describe 'when simple_transportation_pack' do
        let(:simple_transportation){ depot.packs[:simple_transportation_pack] }

        it 'has expected simple_transportation values' do
            expect(simple_transportation[:intelligence]).to eq([:cellphone])
            expect(simple_transportation[:items]).to eq([:medipack, :chevy_versa])
        end
    end

    describe 'when standard_transportation_pack' do
        let(:standard_transportation){ depot.packs[:standard_transportation_pack] }

        it 'has expected standard_transportation values' do
            expect(standard_transportation[:intelligence]).to eq([:cellphone, :antenna])
            expect(standard_transportation[:arsenal]).to eq([:colt_1911])
            expect(standard_transportation[:items]).to eq([:handcuffs, :medipack, :chemistry, :chevy_versa])
        end
    end

    describe 'when simple_mission_pack' do
        let(:simple_mission){ depot.packs[:simple_mission_pack] }
        
        it 'has expected simple_mission values' do
            expect(simple_mission[:intelligence]).to eq([:infopack, :laptop, :cellphone, :antenna])
            expect(simple_mission[:arsenal]).to eq([:colt_1911])
            expect(simple_mission[:items]).to eq([:handcuffs, :medipack, :chemistry, :financial])
        end
    end

    describe 'when standard_mission_pack' do
        let(:standard_mission){ depot.packs[:standard_mission_pack] }
        
        it 'has expected simple_mission values' do
            expect(standard_mission[:intelligence]).to eq([:infopack, :laptop, :cellphone, :antenna])
            expect(standard_mission[:arsenal]).to eq([:remington_870, :colt_1911, :machete, :hatchet])
            expect(standard_mission[:items]).to eq([:handcuffs, :medipack, :chemistry, :financial])
        end
    end
end