require_relative '../environment'
describe 'Control' do
  let(:control) { Environment::Control.new }

  before do
    control.new_mission(:alpha, 'Get Alpha to the base', :simple_transportation_pack)
  end

  it 'checks initialized control missions' do
    expect(control.missions).to include(:alpha)
    expect(control.missions[:alpha][:status]).to eql('active')
    expect(control.missions[:alpha][:objective]).to eql('Get Alpha to the base')
    expect(control.missions[:alpha][:pack]).to eql(:simple_transportation_pack)
  end

  it 'checks control dynamic methods' do
    expect(control).to respond_to(:set_mission_to_paused)
    expect(control).to respond_to(:set_mission_to_aborted)
    expect(control).to respond_to(:set_mission_to_failed)
    expect(control).to respond_to(:set_mission_to_accomplished)
  end
end
