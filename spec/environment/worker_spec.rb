require './environment.rb'

RSpec.describe Environment::Worker do
	let(:worker) { described_class.new('Juan') }

  describe '#set_personal_data' do
    before do
      worker.set_personal_data(
        surname: 'Silva',
        age: 40,
        marital_status: :single,
        children: 0,
        country: :mx,
        language: :es
      )
    end

    it 'assigns surname' do
      expect(worker.personal_data[:surname]).to eq('Silva')
    end

    it 'assigns age' do
      expect(worker.personal_data[:age]).to eq(40)
    end

    it 'assigns marital_status' do
      expect(worker.personal_data[:marital_status]).to eq(:single)
    end

    it 'assigns children' do
      expect(worker.personal_data[:children]).to eq(0)
    end

    it 'assigns country' do
      expect(worker.personal_data[:country]).to eq(:mx)
    end

    it 'assigns language' do
      expect(worker.personal_data[:language]).to eq(:es)
    end
  end

  describe '#set_professinal_data' do
    before do
      worker.set_professional_data(
        position: 'SE', 
        occupation: 'IT',
        skills: [:ruby, :blender],
        observations: 'none'
      )
    end

    it 'assigns position' do
      expect(worker.professional_data[:position]).to eq('SE')
    end

    it 'assigns occupation' do
      expect(worker.professional_data[:occupation]).to eq('IT')
    end

    it 'assigns skills' do
      expect(worker.professional_data[:skills]).to eq([:ruby, :blender])
    end

    it 'assigns observations' do
      expect(worker.professional_data[:observations]).to eq('none')
    end
  end
end
