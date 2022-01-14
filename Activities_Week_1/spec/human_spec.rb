require_relative '../environment'
describe 'Human' do
  let(:human) { Environment::Human.new('Diego') }

  it 'checks initialized human' do
    expect(human.name).to eql('Diego')
    expect(human.name).not_to be_nil
  end

  it 'checks human dynamic methods' do
    expect(human).to respond_to(:set_personal_data)
    expect(human).to respond_to(:set_professional_data)
  end
end
