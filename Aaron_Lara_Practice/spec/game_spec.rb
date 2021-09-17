require_relative '../lib/game.rb'
require_relative '../lib/environment.rb'

# describe Game do
# end

describe Environment::Depot do

    context 'Validate transportation packs content:' do

        it 'simple transportation pack' do
            expect(subject.packs[:simple_transportation_pack][:intelligence]).to eq [:cellphone]
            expect(subject.packs[:simple_transportation_pack][:items]).to eq [:medipack, :chevy_versa]
        end

        it 'standard transportation pack' do
            expect(subject.packs[:standard_transportation_pack][:intelligence]).to eq [:cellphone, :antenna]
            expect(subject.packs[:standard_transportation_pack][:arsenal]).to eq [:colt_1911]
            expect(subject.packs[:standard_transportation_pack][:items]).to eq [:handcuffs, :medipack, :chemistry, :chevy_versa]
        end

        it 'simple mission pack' do
            expect(subject.packs[:simple_mission_pack][:intelligence]).to eq [:infopack, :laptop, :cellphone, :antenna]
            expect(subject.packs[:simple_mission_pack][:arsenal]).to eq [:colt_1911]
            expect(subject.packs[:simple_mission_pack][:items]).to eq [:handcuffs, :medipack, :chemistry, :finantial]
        end

        it 'standard mission pack' do
            expect(subject.packs[:standard_mission_pack][:intelligence]).to eq [:infopack, :laptop, :cellphone, :antenna]
            expect(subject.packs[:standard_mission_pack][:arsenal]).to eq [:remington_870, :colt_1911, :machete, :hatchet]
            expect(subject.packs[:standard_mission_pack][:items]).to eq [:handcuffs, :medipack, :chemistry, :finantial]
        end

    end

end

describe Environment::Control do
    it 'Should create new mission' do
        subject.new_mission name: :alpha, objective: 'Get Alpha to the base', pack: :simple_transportation_pack
        expect(subject.missions.keys).to contain_exactly(:alpha)
        expect(subject.missions[:alpha][:status]).to be(:active)
        expect(subject.missions[:alpha][:objective]).to eq('Get Alpha to the base')
        expect(subject.missions[:alpha][:pack]).to be(:simple_transportation_pack)
    end

    context 'Sould respond to dynamically generated methods' do
        it { is_expected.to respond_to(:set_mission_to_paused) }
        it { is_expected.to respond_to(:set_mission_to_aborted) }
        it { is_expected.to respond_to(:set_mission_to_failed) }
        it { is_expected.to respond_to(:set_mission_to_accomplished) }
    end
end


describe Environment::Human do

    subject do
        Environment::Human.new name: 'Aaron'
    end

    context 'validate Object fields and methods:' do

        it 'Should have valid fields' do
            expect(subject.name).to eq('Aaron')
            expect(subject.id).not_to eq(nil)
        end

        context 'Sould respond to dynamically generated methods' do
            it { is_expected.to respond_to(:set_personal_data) }
            it { is_expected.to respond_to(:set_professional_data) }
        end

    end
end

describe Environment::Worker do
    subject do
        Environment::Worker.new name: 'Juan'
    end

    it 'Should set and validate personal data' do
        is_expected.to respond_to(:set_personal_data)
        subject.set_personal_data surname: 'Silva', age: 40, marital_status: :single, children: 0, country: :mx, language: :es

        expect(subject.personal_data[:surname]).to eq 'Silva'
        expect(subject.personal_data[:age]).to eq 40
        expect(subject.personal_data[:marital_status]).to be :single
        expect(subject.personal_data[:children]).to be 0
        expect(subject.personal_data[:country]).to be :mx
        expect(subject.personal_data[:language]).to be :es
    end

    it 'Should set and validate professional data' do
        is_expected.to respond_to(:set_professional_data)
        subject.set_professional_data position: 'SE', occupation: 'IT', skills: [:ruby, :blender], observations: 'none'

        expect(subject.professional_data[:position]).to eq 'SE'
        expect(subject.professional_data[:occupation]).to eq 'IT'
        expect(subject.professional_data[:skills]).to eq [:ruby, :blender]
        expect(subject.professional_data[:observations]).to eq 'none'
            
    end
end