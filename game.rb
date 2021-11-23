require './environment.rb'
class Game
	include Environment
	attr_accessor :board, :depot, :control
	def initialize
		@board = { players: {}, control: {}, status: nil }
		@depot = Environment::Depot.new
		@control = Environment::Control.new
	end	
	def new_worker (name: nil) 
		@board[:players].store name, Environment::Worker.new(name)
	end
	def new_mission (name: nil, objective: nil, pack: nil)
		@control.new_mission name: name, objective: objective, pack: pack
		@board[:control].store(:missions, @control.missions)
	end
end

game = Game.new

worker = game.new_worker name: 'Rafael'
worker.set_personal_data surname: 'Ruiz Rodriguez', age: 30, marital_status: :single, children: 0, country: :mx, language: :es
worker.set_professional_data position: 'Software Engineer', occupation: 'Dev', skills: [:c_sharp], observations: 'none'
puts "#{worker.name}, #{worker.class}", worker.personal_data, worker.professional_data

name = :alpha; objective = 'Get Alpha to the base'; pack = :simple_transportation_pack
game.new_mission name: name, objective: objective, pack: game.depot.packs[pack]
puts game.control.missions[:alpha]
game.control.set_mission_to_accomplished(:alpha) 
puts game.control.missions[:alpha]

