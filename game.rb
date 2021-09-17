require_relative 'Environment'#not sure about this

class Game
  include Environment

  attr_accessor :board,:depot,:control

  def initialize
    @board = {
      :players => {},
      :control => {},
      :status => nil
    }
    @depot = Depot.new
    @control = Control.new
  end

  def new_worker(name)
    worker = Worker.new
    worker.name = name
    @board[:players][name] = worker
    worker
  end

  def new_mission(name,status = :active,**kwargs) ##ISSUE hwo to do symbol? for :active
    @control.new_mission(name: name,status: status,**kwargs)
    @board[:control] = @control.missions
  end

end

game = Game.new
#depot = Depot.new
#p game.depot.packs
# p depot.packs[:simple_transportation_pack]
#p game.depot.packs[:simple_transportation_pack]

# control = Control.new
name = :alpha and objective = 'Get Alpha to the base' and pack = :simple_transportation_pack
game.control.new_mission name: name,status: 'Active', objective: objective, pack: game.depot.packs[pack]
p game.control.missions
p game.control.missions[:alpha]

#metaprogramming
p "Metaprogramming"
#game.control.set_mission_to_failed(:alpha) 
#puts game.control.missions[:alpha]

##TEST
diego = game.new_worker name: 'Eugenio'
diego.set_personal_data surname: 'Garcia', age: 40, marital_status: :single, children: 0, country: :mx, language: :es
diego.set_professional_data position: 'SE', occupation: 'IT', skills: [:ruby, :blender], observations: 'none'
puts "#{diego.name}, #{diego.class}", diego.personal_data, diego.professional_data
##ISSUE with name not showing

#TEST2
name = :alpha
objective = 'Get Alpha to the base'
pack = :simple_transportation_pack
game.new_mission name: name, objective: objective, pack: game.depot.packs[pack]
puts game.control.missions[:alpha]
game.control.set_mission_to_accomplished(:alpha)
puts game.control.missions[:alpha]

