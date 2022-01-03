require_relative 'environment.rb'

include Environment

class Game

  def initialize
    @board = { players: {}, control: {}, status: nil }
    @depot = Environment::Depot.new
    @control = Environment::Control.new
    status = nil
  end

  def depot
    @depot
  end

  def control
    @control
  end

	def new_worker(name)
	  worker = Environment::Worker.new(name)
    @board[:players] = Hash[name, worker]

    worker
	end

  def new_mission(name:, objective:, pack:)
    @control.new_mission(name, objective, pack)
    @board[:control] = Hash[:missions, @control.missions]
  end
end

  # game = Game.new
  # diego = game.new_worker name: 'Diego'
  # puts diego
  # diego.set_personal_data surname: 'Mota', age: 40, marital_status: :single, children: 0, country: :mx, language: :es
  # diego.set_professional_data position: 'SE', occupation: 'IT', skills: [:ruby, :blender], observations: 'none'
  # puts "#{diego.name}, #{diego.class}", diego.personal_data, diego.professional_data
  ###########################################
  # name = :alpha; objective = 'Get Alpha to the base'; pack = :simple_transportation_pack
  # game.new_mission name: name, objective: objective, pack: game.depot.packs[pack]
  # puts game.control.missions[:alpha]
  # game.control.set_mission_to_accomplished(:alpha)
  # puts game.control.missions[:alpha]
