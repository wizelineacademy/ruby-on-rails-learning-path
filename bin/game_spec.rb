require './environment'
require 'spec_helper'

RSpec.configure do |c|
    c.include Environment
end


RSpec.describe Environment::Depot do

    before(:each) do
        @depot = Environment::Depot.new
    end
    
    it "simple_trasportation_pack contains elements" do
        expect(@depot.packs[:simple_transportation_pack][:intelligence]).to include(:cellphone)
        expect(@depot.packs[:simple_transportation_pack][:items]).to include(:medipack, :chevy_versa)
    end

    it "standard_transportation_pack contains elements" do
        expect(@depot.packs[:standard_transportation_pack][:intelligence]).to include(:cellphone, :antenna)
        expect(@depot.packs[:standard_transportation_pack][:arsenal]).to include(:colt_1911)
        expect(@depot.packs[:standard_transportation_pack][:items]).to include(:handcuffs, :medipack, :chemistry, :chevy_versa)
    end

    it "simple_mission_pack contains elements" do
        expect(@depot.packs[:simple_mission_pack][:intelligence]).to include(:cellphone, :antenna)
        expect(@depot.packs[:simple_mission_pack][:arsenal]).to include(:colt_1911)
        expect(@depot.packs[:simple_mission_pack][:items]).to include(:handcuffs, :medipack, :chemistry, :financial)
    end

    it "standard_mission_pack contains elements" do
        expect(@depot.packs[:standard_mission_pack][:intelligence]).to include(:infopack, :laptop, :cellphone, :antenna)
        expect(@depot.packs[:standard_mission_pack][:arsenal]).to include(:remington_870, :colt_1911, :machete, :hatchet)
        expect(@depot.packs[:standard_mission_pack][:items]).to include(:handcuffs, :medipack, :chemistry, :financial)
    end
end

RSpec.describe Environment::Control do

    before(:each) do
        @control = Environment::Control.new
        @control.new_mission(:alpha, 'Get Alpha to the base', :simple_transportation_pack)

    end
    
    it "missions contains elements" do
        expect(@control.missions.keys).to include(:alpha)
        expect(@control.missions[:alpha][:status]).to eq(:active)
    end

    it "control must contains methods" do
        expect(@control.respond_to?(:set_mission_to_paused)).to eq(true)
        expect(@control.respond_to?(:set_mission_to_aborted)).to eq(true)
        expect(@control.respond_to?(:set_mission_to_failed)).to eq(true)
        expect(@control.respond_to?(:set_mission_to_accomplished)).to eq(true)
    end
end

RSpec.describe Environment::Human do

    before(:each) do
        @human = Environment::Human.new('Diego')

    end
    
    it "human Diego must have attributes" do
        expect(@human.name).to eq('Diego')
        expect(@human.id).not_to be_nil
    end
end

RSpec.describe Environment::Worker do

    before(:each) do
        @worker = Environment::Worker.new('Juan')
        @worker.set_personal_data surname: 'Silva', age: 40, marital_status: :single, children: 0, country: :mx, language: :es
    end
    
    it "worker Juan must have personal data" do
        expect(@worker.personal_data[:surname]).to eq('Silva')
        expect(@worker.personal_data[:age]).to eq(40)
        expect(@worker.personal_data[:marital_status]).to eq(:single)
        expect(@worker.personal_data[:children]).to eq(0)
        expect(@worker.personal_data[:country]).to eq(:mx)
        expect(@worker.personal_data[:language]).to eq(:es)
    end

    it "worker Juan must have professional data" do
        @worker.set_professional_data position: 'SE', occupation: 'IT', skills: [:ruby, :blender], observations: 'none'

        expect(@worker.professional_data[:position]).to eq('SE')
        expect(@worker.professional_data[:occupation]).to eq('IT')
        expect(@worker.professional_data[:skills]).to include(:ruby, :blender)
        expect(@worker.professional_data[:observations]).to eq('none')
    end

end
