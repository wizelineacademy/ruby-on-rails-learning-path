require_relative 'environment'
include Environment

class Game
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

    def new_worker(str)
        worker_name = Environment::Human.new(str)
        @board[:players][str] = worker_name
    end

    def new_mission(name:, objective:, pack:)
        mission = @control.new_mission(name, objective, pack)
        @board[:control][:missions] = mission
    end
end

# game = Game.new

# diego = game.new_worker name: 'Diego'
# diego.set_personal_data surname: 'Mota', age: 40, marital_status: :single, children: 0, country: :mx, language: :es
# diego.set_professional_data position: 'SE', occupation: 'IT', skills: [:ruby, :blender], observations: 'none'
# puts "#{diego.name}, #{diego.class}", diego.personal_data, diego.professional_data


# game.new_mission(name: :alpha, objective: 'Get Alpha to base', pack: :simple_transportation_pack)
# puts game.control.missions[:alpha]

# game.control.set_mission_to_accomplished :alpha
# puts game.control.missions[:alpha]
