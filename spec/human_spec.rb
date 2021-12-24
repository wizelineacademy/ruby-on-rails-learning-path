=begin
@human = Environment::Human.new name: 'Diego'
@human.name must be { :name => 'Diego' }
@human.id must not be nil
@human.respond_to?(:set_personal_data) must be true
@human.respond_to?(:set_professional_data) must be true
=end


require './environment.rb'

RSpec.describe Environment::Human do
    let (:human){ described_class.new('Diego') }

    it 'has a human expected values' do
        expect(human.name).to eq('Diego')
        expect(human.id).not_to be(nil)
        expect(human).to respond_to(:set_personal_data)
        expect(human).to respond_to(:set_professional_data)
    end

end