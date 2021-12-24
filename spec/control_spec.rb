=begin
@control = Environment::Control.new
@control.new_mission name: :alpha, objective: 'Get Alpha to the base', pack: :simple_transportation_pack

@control.missions.keys must caontain [:alpha]
@control.missions[:alpha][:status] must be :active
@control.missions[:alpha][:objective] must be equal to 'Get Alpha to the base'
@control.missions[:alpha][:pack] must be :simple_transportation_pack

@control.respond_to?(:set_mission_to_paused) must be true
@control.respond_to?(:set_mission_to_aborted) must be true
@control.respond_to?(:set_mission_to_failed) must be true
@control.respond_to?(:set_mission_to_accomplished) must be true
=end

require './environment.rb'
require './game.rb'

RSpec.describe Environment::Control do
    let (:control){ described_class.new }

    #Testing mission values
    before do
        control.new_mission(:alpha,'Get Alpha to the base',:simple_transportation_pack)
    end

    it 'has a mission expected values' do
        expect(control.missions.keys).to include(:alpha)
        expect(control.missions[:alpha][:status]).to eq(:active)
        expect(control.missions[:alpha][:objective]).to eq('Get Alpha to the base')
        expect(control.missions[:alpha][:pack]).to eq(:simple_transportation_pack)
    end

    it 'has expected set_mission methods' do
        expect(control.respond_to?(:set_mission_to_paused)).to be_truthy
        expect(control.respond_to?(:set_mission_to_aborted)).to be_truthy
        expect(control.respond_to?(:set_mission_to_failed)).to be_truthy
        expect(control.respond_to?(:set_mission_to_accomplished)).to be_truthy
    end
end