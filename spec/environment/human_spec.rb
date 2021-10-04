require './environment.rb'

RSpec.describe Environment::Human do
	let(:human) { described_class.new('Diego') }

  describe '#initialize' do
    it 'assigns name' do
      expect(human.name).to eq('Diego')
    end

    it 'assigns id' do
      expect(human.id).not_to be(nil)
    end
  end

  describe '#set_data_type' do
    it 'responds to personal data' do
      expect(human).to respond_to(:set_personal_data)
    end

    it 'responds to professional' do
      expect(human).to respond_to(:set_professional_data)
    end
  end
end
