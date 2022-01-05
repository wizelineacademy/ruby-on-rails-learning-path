require_relative "environment.rb"

class Game 
    include Environment
    attr_accessor :board, :depot, :control
    def initialize
        @board = {:players => Hash.new, :control => Hash.new, :status => nil}
        @depot = Environment::Depot.new
        @control = Environment::Control.new
    end
    def new_worker (name: nil)
        @board[:players].store(@control.new_mission(name: name, objective: nil, pack: nil),Environment::Worker.new(name))
    end

    def new_mission (name: nil, objective: nil, pack: nil)
		@control.new_mission(name: name, objective: objective, pack: pack)
		@board[:control].store(:missions, @control.missions)
	end
end

game = Game.new

# Human
diego = game.new_worker name: 'Diego'
diego.set_personal_data surname: 'Mota', age: 40, marital_status: :single, children: 0, country: :mx, language: :es
diego.set_professional_data position: 'SE', occupation: 'IT', skills: [:ruby, :blender], observations: 'none'
puts "#{diego.name}, #{diego.class}", diego.personal_data, diego.professional_data