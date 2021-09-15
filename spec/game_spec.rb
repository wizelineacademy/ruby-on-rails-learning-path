require './lib/environment.rb'
require './lib/game.rb'

RSpec.describe Environment::Depot do
    #Simple transportation pack tests
    context 'Simple transportation pack' do
        let(:pack){:simple_transportation_pack}
        it 'has cellphone inside intelligence' do
            expect(subject.packs[pack][:intelligence]).to include(:cellphone)
        end
        it 'has medipack and chevy_versa inside items' do
            expect(subject.packs[pack][:items]).to include(:medipack, :chevy_versa)
        end
    end
    #Standard transportation pack tests
    context 'Standard transportation pack' do
        let(:pack){:standard_transportation_pack}
        it 'has cellphone and antenna inside intelligence' do
            expect(subject.packs[pack][:intelligence]).to include(:cellphone, :antenna)
        end
        it 'has colt_1911 inside arsenal' do
            expect(subject.packs[pack][:arsenal]).to include(:colt_1911)
        end
        it 'has :handcuffs, :medipack, :chemistry, :chevy_versa inside items' do
            expect(subject.packs[pack][:items]).to include(:handcuffs, :medipack, :chemistry, :chevy_versa)
        end
    end
    #Simple mission pack tests
    context 'Simple mission pack' do
        let(:pack){:simple_mission_pack}
        it 'has :infopack, :laptop, :cellphone, :antenna inside intelligence' do
            expect(subject.packs[pack][:intelligence]).to include(:infopack, :laptop, :cellphone, :antenna)
        end
        it 'has colt_1911 inside arsenal' do
            expect(subject.packs[pack][:arsenal]).to include(:colt_1911)
        end
        it 'has :handcuffs, :medipack, :chemistry, :financial inside items' do
            expect(subject.packs[pack][:items]).to include(:handcuffs, :medipack, :chemistry, :financial)
        end
    end
    #Standard mission pack tests
    context 'Simple mission pack' do
        let(:pack){:standard_mission_pack}
        it 'has :infopack, :laptop, :cellphone, :antenna inside intelligence' do
            expect(subject.packs[pack][:intelligence]).to include(:infopack, :laptop, :cellphone, :antenna)
        end
        it 'has :remington_870, :colt_1911, :machete, :hatchet inside arsenal' do
            expect(subject.packs[pack][:arsenal]).to include(:remington_870, :colt_1911, :machete, :hatchet)
        end
        it 'has :handcuffs, :medipack, :chemistry, :financial inside items' do
            expect(subject.packs[pack][:items]).to include(:handcuffs, :medipack, :chemistry, :financial)
        end
    end
end

RSpec.describe Environment::Control do
    #Mission is correctly initialized inside method
    it 'has a new mission correctly assigned' do
        subject.new_mission name: :alpha, objective: 'Get Alpha to the base', pack: :simple_transportation_pack
        expect(subject.missions.keys).to include(:alpha)
        expect(subject.missions[:alpha][:status]).to eq(:active)
        expect(subject.missions[:alpha][:objective]).to eq('Get Alpha to the base')
        expect(subject.missions[:alpha][:pack]).to eq(:simple_transportation_pack)
    end
    #Control class can respond to set_mission methods
    it 'has expected set_mission methods' do
        expect(subject.respond_to?(:set_mission_to_paused)).to be_truthy
        expect(subject.respond_to?(:set_mission_to_aborted)).to be_truthy
        expect(subject.respond_to?(:set_mission_to_failed)).to be_truthy
        expect(subject.respond_to?(:set_mission_to_accomplished)).to be_truthy
    end
end

RSpec.describe Environment::Human do
    let(:subject) { Environment::Human.new name: 'Diego'}
    #Human class correct initialization
    it 'is correctly initialized' do
        expect(subject.name).to eq('Diego')
        expect(subject.id).not_to be_nil
        expect(subject.respond_to?(:set_personal_data)).to be_truthy
        expect(subject.respond_to?(:set_professional_data)).to be_truthy
    end
end

RSpec.describe Environment::Human::Worker do
    let(:subject) { Environment::Human::Worker.new 'Juan'}
    #Worker class correct initialization of personal data
    it 'sets correctly personal data' do
        subject.set_personal_data surname: 'Silva', age: 40, marital_status: :single, children: 0, country: :mx, language: :es
        expect(subject.personal_data[:surname]).to eq('Silva')
        expect(subject.personal_data[:age]).to eq(40)
        expect(subject.personal_data[:marital_status]).to eq(:single)
        expect(subject.personal_data[:children]).to eq(0)
        expect(subject.personal_data[:country]).to eq(:mx)
        expect(subject.personal_data[:language]).to eq(:es)
    end
    #Worker class correct initialization of professional data
    it 'sets correctly professional data' do
        subject.set_professional_data position: 'SE', occupation: 'IT', skills: [:ruby, :blender], observations: 'none'
        expect(subject.professional_data[:position]).to eq('SE')
        expect(subject.professional_data[:occupation]).to eq('IT')
        expect(subject.professional_data[:skills]).to include(:ruby, :blender)
        expect(subject.professional_data[:observations]).to eq('none')
    end
end

RSpec.describe Game::Dictionary do 
    context 'Hello word' do
        let(:word) {:hello}
        it "translates correctly Hello" do
            expect(subject.expressions[word][:en]).to eq('hello')
            expect(subject.expressions[word][:es]).to eq('hola')
            expect(subject.expressions[word][:cz]).to eq('ahoj')
        end
    end
    context 'goodbye word' do
        let(:word) {:goodbye}
        it "translates correctly goodbye" do
            expect(subject.expressions[word][:en]).to eq('goodbye')
            expect(subject.expressions[word][:es]).to eq('adios')
            expect(subject.expressions[word][:cz]).to eq('nashledanou')
        end
    end
    context 'my_name_is word' do
        let(:word) {:my_name_is}
        it "translates correctly my_name_is" do
            expect(subject.expressions[word][:en]).to eq('my name is')
            expect(subject.expressions[word][:es]).to eq('mi nombre es')
            expect(subject.expressions[word][:cz]).to eq('jmenuju se')
        end
    end
    context 'i_come_from word' do
        let(:word) {:i_come_from}
        it "translates correctly i_come_from" do
            expect(subject.expressions[word][:en]).to eq('i come from')
            expect(subject.expressions[word][:es]).to eq('yo vengo de')
            expect(subject.expressions[word][:cz]).to eq('ja odchazim od')
        end
    end
end