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