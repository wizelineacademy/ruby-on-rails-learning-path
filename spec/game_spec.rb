require 'game'

describe Environment::Control do
    let(:new_mission) {subject.new_mission(name: :alpha, objective: "Get alpha to the base", pack: :simple_transportation_pack)}

    it 'creates a new mission' do
        new_mission
        expect(subject.missions.keys).to contain_exactly(:alpha)
        expect(subject.missions[:alpha][:status]).to eq(:active)
        expect(subject.missions[:alpha][:objective]).to eq("Get alpha to the base")
        expect(subject.missions[:alpha][:pack]).to eq(:simple_transportation_pack)
    end

    context 'a mission can change it status' do
        
        it 'can be paused' do
            expect(subject).to respond_to(:set_mission_to_paused).with(1).arguments
            new_mission
            subject.set_mission_to_paused(:alpha)
            expect(subject.missions[:alpha][:status]).to eq(:paused)
        end

        it 'can be aborted' do
            expect(subject).to respond_to(:set_mission_to_aborted).with(1).arguments
            new_mission
            subject.set_mission_to_aborted(:alpha)
            expect(subject.missions[:alpha][:status]).to eq(:aborted)
        end

        it 'can fail' do
            expect(subject).to respond_to(:set_mission_to_failed).with(1).arguments
            new_mission
            subject.set_mission_to_failed(:alpha)
            expect(subject.missions[:alpha][:status]).to eq(:failed)
        end

        it 'can be accomplished' do
            expect(subject).to respond_to(:set_mission_to_accomplished).with(1).arguments
            new_mission
            subject.set_mission_to_accomplished(:alpha)
            expect(subject.missions[:alpha][:status]).to eq(:accomplished)
        end
    end
end

describe Environment::Human do
    subject {described_class.new(name: "Carlos")}

    it 'has Carlos as its name' do
        expect(subject.name).to eq("Carlos")
    end

    it 'has an id' do
        expect(subject.id).not_to be_nil 
    end

    it 'can set its data' do
        expect(subject).to respond_to(:set_personal_data)
        expect(subject).to respond_to(:set_professional_data)
    end
end

describe Environment::Worker do
    subject {described_class.new(name: "Juan")}
    let(:personal_data) {subject.personal_data}
    let(:professional_data) {subject.professional_data}

    it 'can set its personal data' do
        subject.set_personal_data(
            surname: 'Silvia',
            age: 40,
            country: :mx,
            language: :es,
            marital_status: :single 
        )
        expect(personal_data[:surname]).to eq('Silvia')
        expect(personal_data[:age]).to  eq(40)
        expect(personal_data[:marital_status]).to eq(:single)
        expect(personal_data[:country]).to eq(:mx)
        expect(personal_data[:language]).to eq(:es)   
    end

    it 'can set its professional data' do
        subject.set_professional_data(
            position: 'SE',
            occupation: 'IT',
            skills: [:ruby, :blender],
            observations: 'none'
        )
        expect(professional_data[:position]).to eq('SE')
        expect(professional_data[:occupation]).to eq('IT')
        expect(professional_data[:skills]).to eq([:ruby, :blender])
        expect(professional_data[:observations]).to eq('none')
    end
end

describe Environment::Dictionary do
    let(:expressions) {subject.expressions}

    it 'has all the translations' do
        expect(expressions[:hello][:en]).to eq('hello')
        expect(expressions[:hello][:es]).to eq('hola')
        expect(expressions[:hello][:cz]).to eq('ahoj')

        expect(expressions[:goodbye][:en]).to eq('goodbye')
        expect(expressions[:goodbye][:es]).to eq('adios')
        expect(expressions[:goodbye][:cz]).to eq('nashledanou')

        expect(expressions[:my_name_is][:en]).to eq('my name is')
        expect(expressions[:my_name_is][:es]).to eq('mi nombre es')
        expect(expressions[:my_name_is][:cz]).to eq('jmenuju se')

        expect(expressions[:i_come_from][:en]).to eq('i come from')
        expect(expressions[:i_come_from][:es]).to eq('yo vengo de')
        expect(expressions[:i_come_from][:cz]).to eq('ja odchazim od')
    end

    it 'respond to say methods' do
        expect(subject).to respond_to(:say_hello)
        expect(subject).to respond_to(:say_goodbye)
        expect(subject).to respond_to(:say_my_name_is)
        expect(subject).to respond_to(:say_i_come_from)
    end
end

describe Game do
    let(:control) {subject.control}
    let(:board) {subject.board}
    
    context 'instance variable depot contains propper data' do
        context 'for simple transportation pack' do
            let(:depot) {subject.depot.packs[:simple_transportation_pack]}
            it 'for intelligence' do
                expect(depot[:intelligence]).to include(:cellphone)
            end
            it 'for items' do
                expect(depot[:items]).to include(:medipack, :chevy_versa)
            end
        end

        context 'for standard transportation pack' do
            let(:depot) {subject.depot.packs[:standard_transportation_pack]}
            it 'for intelligence' do
                expect(depot[:intelligence]).to include(:cellphone, :antenna)
            end
            it 'for arsenal' do
                expect(depot[:arsenal]).to include(:colt_1911)
            end
            it 'for items' do
                expect(depot[:items]).to include(:handcuffs, :medipack, :chemistry)
            end
        end

        context 'for simple mission pack' do
            let(:depot) {subject.depot.packs[:simple_mission_pack]}
            it 'for intelligence' do
                expect(depot[:intelligence]).to include(:infopack, :laptop, :cellphone, :antenna)
            end
            it 'for arsenal' do
                expect(depot[:arsenal]).to include(:colt_1911)
            end
            it 'for items' do
                expect(depot[:items]).to include(:handcuffs, :medipack, :chemistry, :financial)
            end
        end

        context 'for standard mission pack' do
            let(:depot) {subject.depot.packs[:standard_mission_pack]}
            it 'for intelligence' do
                expect(depot[:intelligence]).to include(:infopack, :laptop, :cellphone, :antenna)
            end
            it 'for arsenal' do
                expect(depot[:arsenal]).to include(:remington_870, :colt_1911, :machete, :hatchet)
            end
            it 'for items' do
                expect(depot[:items]).to include(:handcuffs, :medipack, :chemistry, :financial)
            end
        end
    end
end     