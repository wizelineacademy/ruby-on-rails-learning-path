#!/usr/bin/env ruby
require_relative 'environment.rb'

class Game 
    include Environment

    attr_accessor :board, :depot, :control

    def initialize
        @depot = Depot.new
        @control = Control.new
        @board = { 
            :players => {},
            :control => {},
            :status => nil
         }
    end

    def new_worker worker_name
        @board[:players][worker_name] = Worker.new
    end

    def new_mission(name: , objective: , pack:)
        @control.new_mission(name: name, objective: objective, pack: depot.packs[pack])
    end
end

game = Game.new

game.new_mission(name: :alpha, objective: 'Get Alpha to base', pack: :simple_transportation_pack)

puts game.control.missions[:alpha]

game.control.alpha_mission_accomplished

puts game.control.missions[:alpha]
