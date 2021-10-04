require './environment.rb'

RSpec.describe Environment::Control do
	let(:control) { described_class.new }

  before do
    control.new_mission(
      :alpha,
      'Get Alpha to the base',
      :simple_transportation_pack
    )
  end

  describe '#missions' do
    it 'returns mission name as key' do
      expect(control.missions.keys).to include(:alpha)
    end

    it 'has active status' do
      expect(control.missions[:alpha][:status]).to eq(:active)
    end

    it 'has assigned objective' do
      expect(control.missions[:alpha][:objective]).to eq('Get Alpha to the base')
    end

    it 'has assigned pack' do
      expect(control.missions[:alpha][:pack]).to eq(:simple_transportation_pack)
    end
  end

  describe '#set_mission_to_' do
    it 'responds to pause' do
      expect(control).to respond_to(:set_mission_to_paused)
    end

    it 'responds to aborted' do
      expect(control).to respond_to(:set_mission_to_aborted)
    end

    it 'responds to failed' do
      expect(control).to respond_to(:set_mission_to_failed)
    end

    it 'responds to accomplished' do
      expect(control).to respond_to(:set_mission_to_accomplished)
    end

    it 'does not respond to other' do
      expect(control).not_to respond_to(:set_mission_to_other)
    end
  end
end
