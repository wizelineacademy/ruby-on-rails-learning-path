require 'spec_helper'
require 'game'

RSpec.describe 'Depot' do
    subject = Environment::Depot.new

    it 'has valid values in transportation packs simple' do
        expect(subject.packs[:simple_transportation_pack][:intelligence]).to eq([:cellphone])
        expect(subject.packs[:simple_transportation_pack][:items]).to eq([:medipack, :chevy_versa])
    end

    it 'has valid values in transportation packs standard' do
        expect(subject.packs[:standard_transportation_pack][:intelligence]).to eq([:cellphone, :antenna])
        expect(subject.packs[:standard_transportation_pack][:arsenal]).to eq([:colt_1911])
        expect(subject.packs[:standard_transportation_pack][:items]).to eq([:handcuffs, :medipack, :chemistry, :chevy_versa])
    end

    it 'has valid values in transportation packs simple mission' do
        expect(subject.packs[:simple_mission_pack][:intelligence]).to eq([:infopack, :laptop, :cellphone, :antenna])
        expect(subject.packs[:simple_mission_pack][:arsenal]).to eq([:colt_1911])
        expect(subject.packs[:simple_mission_pack][:items]).to eq([:handcuffs, :medipack, :chemistry, :financial])
    end

    it 'has valid values in transportation packs standard mission' do
        expect(subject.packs[:standard_mission_pack][:intelligence]).to eq([:infopack, :laptop, :cellphone, :antenna])
        expect(subject.packs[:standard_mission_pack][:arsenal]).to eq([:remington_870, :colt_1911, :machete, :hatchet])
        expect(subject.packs[:standard_mission_pack][:items]).to eq([:handcuffs, :medipack, :chemistry, :financial])
    end

end

RSpec.describe 'Control' do
    subject = Environment::Control.new
    subject.new_mission name: :alpha, objective: 'Get Alpha to the base', pack: :simple_transportation_pack

    it 'has correct values' do
        expect(subject.missions.keys).to include(:alpha)
        expect(subject.missions[:alpha][:status]).to eq(:active) 
        expect(subject.missions[:alpha][:objective]).to eq('Get Alpha to the base') 
        expect(subject.missions[:alpha][:pack]).to eq(:simple_transportation_pack) 
    end

    it 'responds to dynamic methods' do
        expect(subject).to respond_to(:set_mission_to_paused)
        expect(subject).to respond_to(:set_mission_to_aborted)
        expect(subject).to respond_to(:set_mission_to_failed)
        expect(subject).to respond_to(:set_mission_to_accomplished)
    end

end

RSpec.describe Environment::Human do
    subject { Environment::Human.new name: 'Diego' }
    
    it 'has values' do
        expect(subject.name).to eq('Diego')
        expect(subject.id).not_to be_truthy#accepts false but id is not boolean
    end

    it 'responds to dynamic methods' do
        expect(subject).to respond_to(:set_personal_data)
        expect(subject).to respond_to(:set_professional_data)
    end
end

RSpec.describe Environment::Worker do
    let(:worker) {Environment::Worker.new name: 'Juan'}
    

    # before(:context) do
    #     worker.set_personal_data surname: 'Silva', age: 40, marital_status: :single, children: 0, country: :mx, language: :es
    #     worker.set_professional_data position: 'SE', occupation: 'IT', skills: [:ruby, :blender], observations: 'none'
    # end
    
    it 'has personal data' do
        worker.set_personal_data surname: 'Silva', age: 40, marital_status: :single, children: 0, country: :mx, language: :es
        expect(worker.personal_data[:surname]).to eq('Silva')
        expect(worker.personal_data[:age]).to eq(40)
        expect(worker.personal_data[:marital_status]).to eq(:single)
        expect(worker.personal_data[:children]).to eq(0)
        expect(worker.personal_data[:country]).to eq(:mx)
        expect(worker.personal_data[:language]).to eq(:es)
    end

    it 'has professional data' do
        worker.set_professional_data position: 'SE', occupation: 'IT', skills: [:ruby, :blender], observations: 'none'
        expect(worker.professional_data[:position]).to eq('SE')
        expect(worker.professional_data[:occupation]).to eq('IT')
        expect(worker.professional_data[:skills]).to eq([:ruby, :blender])
        expect(worker.professional_data[:observations]).to eq('none')
    end


end
