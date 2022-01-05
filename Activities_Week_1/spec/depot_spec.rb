require_relative '../environment'
describe 'Depot' do
  let(:depot) { Environment::Depot.new }

  it 'checks simple_transportation_pack' do
    expect(depot.packs[:simple_transportation_pack][:intelligence]).to contain_exactly('cellphone')
    expect(depot.packs[:simple_transportation_pack][:items]).to contain_exactly('medipack', 'chevy_versa')
  end

  it 'checks standard_transportation_pack' do
    expect(depot.packs[:standard_transportation_pack][:intelligence]).to contain_exactly('cellphone', 'antenna')
    expect(depot.packs[:standard_transportation_pack][:arsenal]).to contain_exactly('colt_1911')
    expect(depot.packs[:standard_transportation_pack][:items]).to contain_exactly('handcuffs', 'medipack', 'chemistry', 'chevy_versa')
  end

  it 'checks simple_mission_pack' do
    expect(depot.packs[:simple_mission_pack][:intelligence]).to contain_exactly('infopack', 'laptop', 'cellphone', 'antenna')
    expect(depot.packs[:simple_mission_pack][:arsenal]).to contain_exactly('colt_1911')
    expect(depot.packs[:simple_mission_pack][:items]).to contain_exactly('handcuffs', 'medipack', 'chemistry', 'financial')
  end

  it 'checks standard_mission_pack' do
    expect(depot.packs[:standard_mission_pack][:intelligence]).to contain_exactly('infopack', 'laptop', 'cellphone', 'antenna')
    expect(depot.packs[:standard_mission_pack][:arsenal]).to contain_exactly('remington_870', 'colt_1911', 'machete', 'hatchet')
    expect(depot.packs[:standard_mission_pack][:items]).to contain_exactly('handcuffs', 'medipack', 'chemistry', 'financial')
  end
end
