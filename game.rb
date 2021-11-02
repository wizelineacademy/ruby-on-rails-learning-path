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
    new_player = Environment::Worker.new
    @board[:players][name] = new_player
  end

  def new_mission(name:, objective:, pack:)
    @control.new_mission(name: name, objective: objective, pack: pack)
    @board[:control][name] = @control.missions[name]
  end
end