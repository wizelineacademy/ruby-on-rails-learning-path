require_relative 'environment.rb'
class Game
	include Environment
	attr_accessor :board, :depot, :control, :dictionary, :poker
	def initialize
		@board = { players: Hash.new, control: Hash.new, status: nil }
		@depot = Environment::Depot.new
		@control = Environment::Control.new
		@dictionary = Environment::Dictionary.new # Optional
		@poker = Environment::Poker.new # Optional
	end
	
	def new_worker name: nil 
		@board[:players].store name, Environment::Worker.new(name)
	end
	
	def new_mission name: nil, objective: nil, pack: nil
		@control.new_mission name: name, objective: objective, pack: pack
		@board[:control].store(:missions, @control.missions)
	end
	
	# optional
	def new_poker_game players: nil
		@poker.new_game players: players
	end
end

game = Game.new

# Human
diego = game.new_worker name: 'Diego'
diego.set_personal_data surname: 'Mota', age: 40, marital_status: :single, children: 0, country: :mx, language: :es
diego.set_professional_data position: 'SE', occupation: 'IT', skills: [:ruby, :blender], observations: 'none'
puts "#{diego.name}, #{diego.class}", diego.personal_data, diego.professional_data

# Mission control
name = :alpha; objective = 'Get Alpha to the base'; pack = :simple_transportation_pack
game.new_mission name: name, objective: objective, pack: game.depot.packs[pack]
puts game.control.missions[:alpha]
game.control.set_mission_to_accomplished(:alpha) and puts game.control.missions[:alpha]

#--------------------------------------------------------------------------------
# optional

# Dictionary
language = diego.personal_data[:language] and hello = game.dictionary.say_hello(language)
my_name_is = game.dictionary.say_my_name_is(language) and i_come_from = game.dictionary.say_i_come_from(language)
puts "#{hello}, #{my_name_is} #{diego.name}, #{i_come_from} #{diego.personal_data[:country]}"

# Poker 
players = ['Diego', 'Juan'] and game.new_poker_game players: players
players.each do |player|
	puts player
	game.poker.table = game.poker.swap player: player, table: game.poker.table
end
# puts set_winner

#