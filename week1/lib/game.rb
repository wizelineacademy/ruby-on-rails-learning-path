require_relative './environment.rb'

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
        @board[:players].store(name, Environment::Worker.new(name))
    end

    def new_mission(name:, objective:, pack:)
        @control.new_mission(name: name, objective: objective, pack: pack)
        @board[:control].store(:missions, @control.missions)
    end
end