require_relative 'environment'

class Game
  include Environment
  attr_accessor :depot, :board, :control

  def initialize
    @board = { 'players': nil, 'control': nil, 'status': nil }
    @depot = Environment::Depot.new
    @control = Environment::Control.new
  end

  def new_worker(name:)
    worker = Environment::Worker.new(name)
    @board[:players] = { name => worker }
    worker
  end

  def new_mission(name:, objective:, pack:)
    @control.new_mission(name, objective, pack)
    @board[:control] = { 'missions': @control.missions }
  end
end

game = Game.new
puts 'CREATING NEW WORKER...'
carlos = game.new_worker(name: 'Carlos')
carlos.set_personal_data(surname: 'Gonzalez', age: 26, country: 'mx', language: 'es', marital_status: 'single', children: 0)
carlos.set_professional_data(position: 'SWE', occupation: 'IT', skills: %w[ruby c#], observations: 'none')
puts "#{carlos.name}, #{carlos.class}", carlos.personal_data, carlos.professional_data

puts 'CREATING NEW MISSION...'
game.new_mission(name: :alpha, objective: 'Get Alpha to the base', pack: game.depot.packs[:standard_mission_pack])
puts game.control.missions[:alpha]

puts 'SETTING MISSION TO ACCOMPLISHED...'
game.control.set_mission_to_accomplished(:alpha)
puts game.control.missions[:alpha]

puts 'CURRENT GAME BOARD:'
puts "Players: #{game.board[:players]}"
puts "Control: #{game.board[:control]}"
