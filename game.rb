require_relative 'environment'
include Environment

class Game
    attr_accessor :board, :depot, :control

    def initialize
        @board = { :players => {}, :control => {}, :status => nil }
        @depot = Environment::Depot.new,
        @control = Environment::Control.new
    end

    def new_worker(name:)
        worker = Environment::Worker.new(name)
        @board[:players] = {name => worker}
        worker
    end

    def new_mission(name:, objective:, pack:)
        @control.new_mission(name, objective, pack)
        @board[:control] = {:missions => @control.missions}
    end
end




#Validate
game = Game.new
diego = game.new_worker name: 'Diego'
diego.set_personal_data surname: 'Mota', age: 40, marital_status: :single, children: 0, country: :mx, language: :es
diego.set_professional_data position: 'SE', occupation: 'IT', skills: [:ruby, :blender], observations: 'none'
puts "#{diego.name}, #{diego.class}", diego.personal_data, diego.professional_data
