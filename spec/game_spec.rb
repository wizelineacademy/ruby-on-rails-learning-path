require './game'


RSpec.describe Environment::Depot do
    
    context 'Simple transportation pack testing' do
        it 'Simple transportation pack intelligence content' do
            expect(subject.packs[:simple_transportation_pack][:intelligence]).to include(:cellphone)
        end
        
        it 'Simple transportation pack items content' do
            expect(subject.packs[:simple_transportation_pack][:items]).to include(:chevy_versa)
        end
    end

    context 'Standard transportation pack testing' do
        it 'Standard transportation pack intelligente content' do
            expect(subject.packs[:standard_transportation_pack][:intelligence]).to include(:cellphone, :antenna)
        end
        
        it 'Standard transportation pack arsenal content' do
            expect(subject.packs[:standard_transportation_pack][:arsenal]).to include(:colt_1911)
        end

        it 'Standard transportation pack items content' do
            expect(subject.packs[:standard_transportation_pack][:items]).to include(:handcuffs, :medipack, :chemistry, :chevy_versa)
        end
    end

    context 'Simple mission pack testing' do
        it 'Simple mission pack intelligente content' do
            expect(subject.packs[:simple_mission_pack][:intelligence]).to include(:infopack, :laptop, :cellphone, :antenna)
        end
        
        it 'Simple mission pack arsenal content' do
            expect(subject.packs[:simple_mission_pack][:arsenal]).to include(:colt_1911)
        end

        it 'Simple mission pack items content' do
            expect(subject.packs[:simple_mission_pack][:items]).to include(:handcuffs, :medipack, :chemistry, :financial)
        end
    end

    context 'Standard mission pack testing' do
        it 'Standard mission pack intelligente content' do
            expect(subject.packs[:standard_mission_pack][:intelligence]).to include(:infopack, :laptop, :cellphone, :antenna)
        end
        
        it 'Standard mission pack arsenal content' do
            expect(subject.packs[:standard_mission_pack][:arsenal]).to include(:remington_870, :colt_1911, :machete, :hatchet)
        end

        it 'Standard mission pack items content' do
            expect(subject.packs[:standard_mission_pack][:items]).to include(:handcuffs, :medipack, :chemistry, :financial)
        end
    end

end

RSpec.describe Environment::Control do
    before do
        subject.new_mission(:alpha, 'Get Alpha to the base', :simple_transportation_pack)
    end

    it 'Control mission keys' do
        expect(subject.missions.keys).to include(:alpha)
    end

    it 'Control mission status' do
        expect(subject.missions[:alpha][:status]).to eq(:active)
    end

    it 'Control mission objective' do
        expect(subject.missions[:alpha][:objective]).to eq('Get Alpha to the base')
    end

    it 'Control mission pack' do
        expect(subject.missions[:alpha][:pack]).to eq(:simple_transportation_pack)
    end

    it 'Control set mission to paused' do
        expect(subject.respond_to?(:set_mission_to_paused)).to be_truthy
    end

    it 'Control set mission to ' do
        expect(subject.respond_to?(:set_mission_to_aborted)).to be_truthy
    end

    it 'Control set mission to ' do
        expect(subject.respond_to?(:set_mission_to_failed)).to be_truthy
    end

    it 'Control set mission to ' do
        expect(subject.respond_to?(:set_mission_to_accomplished)).to be_truthy
    end
end

RSpec.describe Environment::Human do
    let(:subject) { Environment::Human::Worker.new 'Diego'}
    
    it 'Human name' do
        expect(subject.name).to eq('Diego')
    end

    it 'Human ID' do
        expect(subject.id).not_to be_nil
    end

    it 'Human set personal data' do
        expect(subject.respond_to?(:set_personal_data)).to be_truthy
    end

    it 'Human set professional data' do
        expect(subject.respond_to?(:set_professional_data)).to be_truthy
    end
end


RSpec.describe Environment::Human::Worker do
    let(:subject) { Environment::Human::Worker.new 'Juan'}

    it 'set personal data' do
        subject.set_personal_data surname: 'Silvia', age: 40, marital_status: :single, children: 0, country: :mx, language: :es
        expect(subject.personal_data[:surname]).to eq('Silvia')
        expect(subject.personal_data[:age]).to eq(40)
        expect(subject.personal_data[:marital_status]).to eq(:single)
        expect(subject.personal_data[:children]).to eq(0)
        expect(subject.personal_data[:country]).to eq(:mx)
        expect(subject.personal_data[:language]).to eq(:es)
    end

    it 'set professional data' do
        subject.set_professional_data position: 'SE', occupation: 'IT', skills: [:ruby, :blender], observations: 'none'
        expect(subject.professional_data[:position]).to eq('SE')
        expect(subject.professional_data[:occupation]).to eq('IT')
        expect(subject.professional_data[:skills]).to include(:ruby, :blender)
        expect(subject.professional_data[:observations]).to eq('none')
    end 
end
