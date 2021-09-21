require_relative 'environment'

class Game 
  include Environment
  attr_accessor :board, :depot, :control

  def initialize
    @board = {
      status: nil,
      players: {},
      control: {}
    }
    @depot = Environment::Depot.new
    @control = Environment::Control.new
  end

  def new_worker name
    worker = Environment::Human.new name
    @board[:players][name] = worker
  end

  def new_mission(name, objective, pack)
    mission = @control.new_mission(name, objective, pack)
    @board[:control][:missions] = mission
  end

end

game = Game.new
john = game.new_worker 'John'
john.set_personal_data({surname: 'Doe', age: 40, marital_status: :single, children: 0, country: :mx, language: :es})
john.set_professional_data({position: 'SE', occupation: 'IT', skills: [:ruby, :blender], observations: 'none'})

puts 'PLAYERS: ', game.board[:players]

game.new_mission(name = :alpha, objective = 'Get Alpha to the base', pack = :simple_transportation_pack)

puts 'MISSIONS: ', game.control.missions

game.control.set_mission_to_accomplished :alpha

puts game.control.missions
