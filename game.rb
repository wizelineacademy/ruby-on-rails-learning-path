require './environment'

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

  def new_worker(name:)
    new_player = Environment::Worker.new name: name
    @board[:players][name] = new_player
  end

  def new_mission(name:, objective:, pack:)
    @control.new_mission(name: name, objective: objective, pack: pack)
    @board[:control][name] = @control.missions[name]
  end
end 

game = Game.new
weyler = game.new_worker name: 'Weyler'
weyler.set_personal_data surname: 'Maldonado', age: 24, marital_status: :single, children: 0, country: :mx, language: :es
weyler.set_professional_data position: 'SE', occupation: 'IT', skills: [:ruby, :blender], observations: 'none'
puts "#{weyler.name}, #{weyler.class}", weyler.personal_data, weyler.professional_data

testA5 = Game.new
testA5.new_mission name: :alpha, objective: 'Get Alpha to the base', pack: testA5.depot.packs[:simple_transportation_pack]
puts testA5.control.missions[:alpha]
testA5.control.set_mission_to_accomplished(:alpha)
puts testA5.control.missions[:alpha]
