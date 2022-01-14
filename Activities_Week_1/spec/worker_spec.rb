require_relative '../environment'
describe 'Worker' do
  let(:worker) { Environment::Worker.new('Juan') }

  before do
    worker.set_personal_data(surname: 'Silva', age: 40, country: 'mx', language: 'es', marital_status: 'single', children: 0)
    worker.set_professional_data(position: 'SE', occupation: 'IT', skills: %w[ruby blender], observations: 'none')
  end

  it 'checks initialized worker personal data' do
    expect(worker.personal_data[:surname]).to eql('Silva')
    expect(worker.personal_data[:age]).to eql(40)
    expect(worker.personal_data[:marital_status]).to eql('single')
    expect(worker.personal_data[:children]).to eql(0)
    expect(worker.personal_data[:country]).to eql('mx')
    expect(worker.personal_data[:language]).to eql('es')
  end

  it 'checks initialized worker professional data' do
    expect(worker.professional_data[:position]).to eql('SE')
    expect(worker.professional_data[:occupation]).to eql('IT')
    expect(worker.professional_data[:skills]).to eql(%w[ruby blender])
    expect(worker.professional_data[:observations]).to eql('none')
  end
end
