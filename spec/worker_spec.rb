=begin
@worker = Environment::Worker.new 'Juan'
@worker.set_personal_data surname: 'Silva', age: 40, marital_status: :single, children: 0, country: :mx, language: :es
expect(@worker.personal_data[:surname] must be 'Silva'
expect(@worker.personal_data[:age] must be 40
expect(@worker.personal_data[:marital_status] must be :single
expect(@worker.personal_data[:children] must be 0
expect(@worker.personal_data[:country] must be :mx
expect(@worker.personal_data[:language] must be :es

@worker.set_professional_data position: 'SE', occupation: 'IT', skills: [:ruby, :blender], observations: 'none'
expect(@worker.professional_data[:position] must be 'SE'
expect(@worker.professional_data[:occupation] must be 'IT'
expect(@worker.professional_data[:skills] must content [:ruby, :blender]
=end


require './environment.rb'

RSpec.describe Environment::Human::Worker do
    let(:worker) { Environment::Human::Worker.new 'Juan'}

    it 'has expected personal_data values' do
        worker.set_personal_data surname: 'Silva', age: 40, marital_status: :single, children: 0, country: :mx, language: :es 
        expect(worker.personal_data[:surname]).to eq('Silva')
        expect(worker.personal_data[:age]).to eq(40)
        expect(worker.personal_data[:marital_status]).to eq(:single)
        expect(worker.personal_data[:children]).to eq(0)
        expect(worker.personal_data[:country]).to eq(:mx)
        expect(worker.personal_data[:language]).to eq(:es)
    end

    it 'has expected professional_data values' do
        worker.set_professional_data position: 'SE', occupation: 'IT', skills: [:ruby, :blender], observations: 'none'
        expect(worker.professional_data[:position]).to eq('SE')
        expect(worker.professional_data[:occupation]).to eq('IT')
        expect(worker.professional_data[:skills]).to include(:ruby, :blender)
        expect(worker.professional_data[:observations]).to eq('none')
    end
end