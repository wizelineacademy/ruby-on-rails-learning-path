require 'spec_helper'
require 'game'

describe Game do

	before do
		@board = { players: Hash.new, control: Hash.new, status: nil }
		@human = Environment::Human.new name: 'Diego'
		@depot = Environment::Depot.new
		@control = Environment::Control.new
		@dictionary = Environment::Dictionary.new # Optional
		@poker = Environment::Poker.new # Optional
	end
	
	context 'Depot' do
		it 'simple_transportation_pack has the right elements' do
			expect(@depot.packs[:simple_transportation_pack][:intelligence]).to eq [:cellphone]
			expect(@depot.packs[:simple_transportation_pack][:items]).to eq [:medipack, :chevy_versa]
		end
		it 'standard_transportation_pack has the right elements' do
			expect(@depot.packs[:standard_transportation_pack][:intelligence]).to eq [:cellphone, :antenna]
			expect(@depot.packs[:standard_transportation_pack][:arsenal]).to eq [:colt_1911]
			expect(@depot.packs[:standard_transportation_pack][:items]).to eq [:handcuffs, :medipack, :chemistry, :chevy_versa]
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
	
	context 'Control' do
		it 'sets the right values on missions' do
			@control.new_mission name: :alpha, objective: 'Get Alpha to the base', pack: :simple_transportation_pack
			expect(@control.missions.keys).to eq [:alpha]
			expect(@control.missions[:alpha][:status]).to eq :active
			expect(@control.missions[:alpha][:objective]).to eq 'Get Alpha to the base'
			expect(@control.missions[:alpha][:pack]).to eq :simple_transportation_pack
		end
		it 'respond to the right dynamic methods' do
			expect(@control.respond_to?(:set_mission_to_paused)).to be true
			expect(@control.respond_to?(:set_mission_to_aborted)).to be true
			expect(@control.respond_to?(:set_mission_to_failed)).to be true
			expect(@control.respond_to?(:set_mission_to_accomplished)).to be true
		end
	end
	
	context 'Human' do
		it 'sets the right values on initialization' do
			expect(@human.name).to be { :name => 'Diego' }
			expect(@human.id).not_to be nil
		end
		it 'respond to the right dynamic methods' do
			expect(@human.respond_to?(:set_personal_data)).to be true
			expect(@human.respond_to?(:set_professional_data)).to be true
		end
	end
	
	context 'Worker' do
		it 'sets the right values on methods' do
			@worker = Environment::Worker.new 'Juan'
			@worker.set_personal_data surname: 'Silva', age: 40, marital_status: :single, children: 0, country: :mx, language: :es
			expect(@worker.personal_data[:surname]).to eq 'Silva'
			expect(@worker.personal_data[:age]).to eq 40
			expect(@worker.personal_data[:marital_status]).to eq :single
			expect(@worker.personal_data[:children]).to eq 0
			expect(@worker.personal_data[:country]).to eq :mx
			expect(@worker.personal_data[:language]).to eq :es
			@worker.set_professional_data position: 'SE', occupation: 'IT', skills: [:ruby, :blender], observations: 'none'
			expect(@worker.professional_data[:position]).to eq 'SE'
			expect(@worker.professional_data[:occupation]).to eq 'IT'
			expect(@worker.professional_data[:skills]).to eq [:ruby, :blender]
			expect(@worker.professional_data[:observations]).to eq 'none'
		end
	end
	
	context 'Dictionary' do
		it '@expressions[:hello] is well initializated' do
			expect(@dictionary.expressions[:hello][:en]).to eq 'hello'
			expect(@dictionary.expressions[:hello][:es]).to eq 'hola'
			expect(@dictionary.expressions[:hello][:cz]).to eq 'ahoj'
		end
		it '@expressions[:goodbye] is well initializated' do
			expect(@dictionary.expressions[:goodbye][:en]).to eq 'goodbye'
			expect(@dictionary.expressions[:goodbye][:es]).to eq 'adios'
			expect(@dictionary.expressions[:goodbye][:cz]).to eq 'nashledanou'
		end
		it '@expressions[:my_name_is] is well initializated' do
			expect(@dictionary.expressions[:my_name_is][:en]).to eq 'my name is'
			expect(@dictionary.expressions[:my_name_is][:es]).to eq 'mi nombre es'
			expect(@dictionary.expressions[:my_name_is][:cz]).to eq 'jmenuju se'
		end
		it '@expressions[:i_come_from] is well initializated' do
			expect(@dictionary.expressions[:i_come_from][:en]).to eq 'i come from'
			expect(@dictionary.expressions[:i_come_from][:es]).to eq 'yo vengo de'
			expect(@dictionary.expressions[:i_come_from][:cz]).to eq 'ja odchazim od'
		end
		it 'respond to the right dynamic methods' do
			expect(@dictionary.respond_to?(:say_hello)).to be true
			expect(@dictionary.respond_to?(:say_goodbye)).to be true
			expect(@dictionary.respond_to?(:say_my_name_is)).to be true
			expect(@dictionary.respond_to?(:say_i_come_from)).to be true
		end	
	end
	
	context 'Poker' do
		it 'initalize all the cards' do
			sorts = [:swords, :clovers, :hearts, :diamonds] and deck = Array.new
			cards = [:ace, :king, :queen, :jack, :nine, :eight, :seven, :six, :five, :four, :three, :two, :one]
			cards.each { |card| sorts.each { |sort| deck.push("#{card}_of_#{sort}".to_sym) }}
			expect(deck).to eq [:ace_of_swords, :ace_of_clovers, :ace_of_hearts, :ace_of_diamonds, :king_of_swords, :king_of_clovers, :king_of_hearts, :king_of_diamonds, :queen_of_swords, :queen_of_clovers, :queen_of_hearts, :queen_of_diamonds, :jack_of_swords, :jack_of_clovers, :jack_of_hearts, :jack_of_diamonds, :nine_of_swords, :nine_of_clovers, :nine_of_hearts, :nine_of_diamonds, :eight_of_swords, :eight_of_clovers, :eight_of_hearts, :eight_of_diamonds, :seven_of_swords, :seven_of_clovers, :seven_of_hearts, :seven_of_diamonds, :six_of_swords, :six_of_clovers, :six_of_hearts, :six_of_diamonds, :five_of_swords, :five_of_clovers, :five_of_hearts, :five_of_diamonds, :four_of_swords, :four_of_clovers, :four_of_hearts, :four_of_diamonds, :three_of_swords, :three_of_clovers, :three_of_hearts, :three_of_diamonds, :two_of_swords, :two_of_clovers, :two_of_hearts, :two_of_diamonds, :one_of_swords, :one_of_clovers, :one_of_hearts, :one_of_diamonds]
		end
	end
end























