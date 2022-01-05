require 'spec_helper'
require 'game'

RSpec.describe Game do
    before do
		@board = { players: Hash.new, control: Hash.new, status: nil }
		@human = Environment::Human.new name: 'Diego'
		@depot = Environment::Depot.new
		@control = Environment::Control.new
    end
    context 'Depot' do
        it 'simple_transportation_pack has the correct elements' do
            expect(@depot.packs[:simple_transportation_pack][:intelligence]).to eq([:cellphone])   
            expect(@depot.packs[:simple_transportation_pack][:items]).to eq([:medipack,:chevy_versa])
        end

    it 'standard_transportation_pack has the correct elements' do
            expect(@depot.packs[:standard_transportation_pack][:intelligence]).to eq([:cellphone,:antenna])
            expect(@depot.packs[:standard_transportation_pack][:arsenal]).to eq([:colt_1911])
            expect(@depot.packs[:standard_transportation_pack][:items]).to eq([:handcuffs,:medipack,:chemistry,:chevy_versa])
        end

        it 'simple_mission_pack has the right elements' do
			expect(@depot.packs[:simple_mission_pack][:intelligence]).to eq [:infopack, :laptop, :cellphone, :antenna]
			expect(@depot.packs[:simple_mission_pack][:arsenal]).to eq [:colt_1911]
			expect(@depot.packs[:simple_mission_pack][:items]).to eq [:handcuffs, :medipack, :chemistry, :financial]
		end

		it 'standard_transportation_pack has the right elements' do
			expect(@depot.packs[:standard_mission_pack][:intelligence]).to eq [:infopack, :laptop, :cellphone, :antenna]
			expect(@depot.packs[:standard_mission_pack][:arsenal]).to eq [:remington_870, :colt_1911, :machete, :hatchet]
			expect(@depot.packs[:standard_mission_pack][:items]).to eq [:handcuffs, :medipack, :chemistry, :financial]
		end

    end

    context "Control" do
        it 'new_mission has the right values' do
            @control.new_mission name: :alpha, objective: 'Get Alpha to the base', pack: :simple_transportation_pack
            expect(@control.missions.keys).to eq([:alpha])
            expect(@control.missions[:alpha][:status]).to eq(:active)
            expect(@control.missions[:alpha][:objective]).to eq('Get Alpha to the base')
            expect(@control.missions[:alpha][:pack]).to eq(:simple_transportation_pack)
        end

        it 'set_mission should change the mission correctly' do
            expect(@control.respond_to?(:set_mission_to_paused)).to be true
            expect(@control.respond_to?(:set_mission_to_aborted)).to be true
            expect(@control.respond_to?(:set_mission_to_failed)).to be true
            expect(@control.respond_to?(:set_mission_to_accomplished)).to be true
        end
        
    end

    context "Human" do
        it 'creates Human correctly' do
            @human = Environment::Human.new('Diego')
            expect(@human.name).to eq("Diego")
            expect(@human.id).to be
        end
        it 'responds to dynaic methods correctly' do
            expect(@human.respond_to?(:set_personal_data)).to be true
            expect(@human.respond_to?(:set_professional_data)).to be true
        end
        
    end

    context "Worker" do
        
        it  'generates data correctly' do
            @worker = Environment::Worker.new 'Juan'
            @worker.set_personal_data surname: 'Silva', age: 40, marital_status: :single, children: 0, country: :mx, language: :es
            expect(@worker.personal_data[:surname]).to eq('Silva')
            expect(@worker.personal_data[:age]).to eq(40)
            expect(@worker.personal_data[:marital_status]).to eq(:single)
            expect(@worker.personal_data[:children]).to eq(0)
            expect(@worker.personal_data[:country]).to eq(:mx)
            expect(@worker.personal_data[:language]).to eq(:es)
            @worker.set_professional_data position: 'SE', occupation: 'IT', skills: [:ruby, :blender], observations: 'none'
            expect(@worker.professional_data[:position]).to eq('SE')
            expect(@worker.professional_data[:occupation]).to eq('IT')
            expect(@worker.professional_data[:skills]).to eq([:ruby, :blender])
            expect(@worker.professional_data[:observations]).to eq('none')

        end
    end
    
    
    
    
    
end
