#!/usr/bin/env ruby
require_relative 'environment.rb'

class Game 
    include Environment

    attr_accessor :depot
    attr_accessor :control

    def initialize
        @depot = Depot.new
        @control = Control.new
    end
end

# game = Game.new
# puts game.depot.packs[:simple_transportation_pack]

# game.control.new_mission(name: :alpha, objective: 'Get Alpha to base', pack: game.depot.packs[:simple_transportation_pack])

# p game.control.missions[:alpha]

# game.control.alpha_mission_aborted

# p game.control.missions[:alpha]

