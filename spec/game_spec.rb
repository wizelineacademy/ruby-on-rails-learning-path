require './environment'

RSpec.describe Environment do
  context Environment::Depot do
    let(:depot) { described_class.new }

    it 'validates simple_transportation_pack property' do
      expect(depot.packs[:simple_transportation_pack][:intelligence]).to contain_exactly(:cellphone)
      expect(depot.packs[:simple_transportation_pack][:items]).to contain_exactly(:medipack, :chevy_versa)
    end

    it 'validates standard_transportation_pack property' do
      expect(depot.packs[:standard_transportation_pack][:intelligence]).to contain_exactly(:cellphone, :antenna)
      expect(depot.packs[:standard_transportation_pack][:arsenal]).to contain_exactly(:colt_1911)
      expect(depot.packs[:standard_transportation_pack][:items]).to contain_exactly(:handcuffs, :medipack, :chemistry, :chevy_versa)
    end

    it 'validates simple_mission_pack property' do
      expect(depot.packs[:simple_mission_pack][:intelligence]).to contain_exactly(:infopack, :laptop, :cellphone, :antenna)
      expect(depot.packs[:simple_mission_pack][:arsenal]).to contain_exactly(:colt_1911)
      expect(depot.packs[:simple_mission_pack][:items]).to contain_exactly(:handcuffs, :medipack, :chemistry, :financial)
    end

    it 'validates standard_mission_pack property' do
      expect(depot.packs[:standard_mission_pack][:intelligence]).to contain_exactly(:infopack, :laptop, :cellphone, :antenna)
      expect(depot.packs[:standard_mission_pack][:arsenal]).to contain_exactly(:remington_870, :colt_1911, :machete, :hatchet)
      expect(depot.packs[:standard_mission_pack][:items]).to contain_exactly(:handcuffs, :medipack, :chemistry, :financial)
    end
  end

  context Environment::Control do
    let(:control) { described_class.new }

    it 'should create a new mission' do
      control.new_mission name: :alpha, objective: 'Get alpha to the base', pack: :simple_transportation_pack

      expect(control.missions.keys).to contain_exactly(:alpha)
      expect(control.missions[:alpha][:status]).to equal(:active)
      expect(control.missions[:alpha][:objective]).to eq('Get alpha to the base')
      expect(control.missions[:alpha][:pack]).to equal(:simple_transportation_pack)
    end

    it 'should respond to dynamic methods' do
      expect(control.respond_to?(:set_mission_to_paused)).to be_truthy
      expect(control.respond_to?(:set_mission_to_aborted)).to be_truthy
      expect(control.respond_to?(:set_mission_to_failed)).to be_truthy
      expect(control.respond_to?(:set_mission_to_accomplished)).to be_truthy
    end
  end

  context Environment::Human do
    let(:human) { described_class.new name: 'Diego' }

    it 'should validate the properties' do
      expect(human.name).to eq('Diego')
      expect(human.id).not_to be_nil
      expect(human.respond_to?(:set_personal_data)).to be_truthy
      expect(human.respond_to?(:set_professional_data)).to be_truthy
    end
  end

  context Environment::Worker do
    let(:worker) { described_class.new name: 'Juan' }

    it 'should set the personal data' do
      worker.set_personal_data surname: 'Silva', age: 40, marital_status: :single, children: 0, country: :mx, language: :es
      
      expect(worker.personal_data[:surname]).to eq('Silva')
      expect(worker.personal_data[:age]).to eq(40)
      expect(worker.personal_data[:marital_status]).to equal(:single)
      expect(worker.personal_data[:children]).to eq(0)
      expect(worker.personal_data[:country]).to equal(:mx)
      expect(worker.personal_data[:language]).to equal(:es)
    end

    it 'should set the professional data' do
      worker.set_professional_data position: 'SE', occupation: 'IT', skills: [:ruby, :blender], observations: 'none'
      
      expect(worker.professional_data[:position]).to eq('SE')
      expect(worker.professional_data[:occupation]).to eq('IT')
      expect(worker.professional_data[:skills]).to contain_exactly(:ruby, :blender)
      expect(worker.professional_data[:observations]).to eq('none')
    end
  end
end