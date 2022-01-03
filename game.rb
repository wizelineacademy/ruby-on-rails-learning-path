require_relative 'environment'

class Game 
  include Environment
  attr_accessor :board, :depot, :control

  def initialize
    @board = {
      players: {},
      control: {},
      status: nil
    }
    @depot = Environment::Depot.new
    @control = Environment::Control.new
  end

  def new_worker(name)
    worker = Environment::Human.new(name)
    @board[:players][name] = worker
  end

  def new_mission(name:, objective:, pack:)
    mission = @control.new_mission(name, objective, pack)
    @board[:control][:missions] = mission
  end
end

game = Game.new

diego = game.new_worker(name: 'Diego')
diego.set_personal_data(surname: 'Mota', age: 40, marital_status: :single, children: 0, country: :mx, language: :es)
diego.set_professional_data(position: 'SE', occupation: 'IT', skills: [:ruby, :blender], observations: 'none')
puts "#{diego.name}, #{diego.class} #{diego.personal_data}, #{diego.professional_data}."

puts "*"*100

game.new_mission(name: :alpha, objective: 'Get Alpha to base', pack: :simple_transportation_pack)
puts game.control.missions[:alpha]

game.control.set_mission_to_accomplished :alpha
puts game.control.missions[:alpha]


