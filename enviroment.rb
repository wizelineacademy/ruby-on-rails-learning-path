module Enviroment
end

class Depot
  @packs = { 
    :simple_transportation_pack => {
      :intelligence => [:cellphone],
      items => [:medipack, :chevy_versa], 
    },
    :standard_transportation_pack =>{
      :intelligence => [:cellphone, :antenna],
      :arsenal => [:colt_1911],
      :items => [:handcuffs, :medipack, :chemistry, :chevy_versa]
    },
    :simple_mission_pack =>{
      :intelligence => [:infopack, :laptop, :cellphone, :antenna],
      :arsenal=> [:colt_1911],
      :items => [:handcuffs, :medipack, :chemistry, :financial]
    },
    :standard_mission_pack =>{
      :intelligence => [:infopack, :laptop, :cellphone, :antenna],
      :arsenal => [:remington_870, :colt_1911, :machete, :hatchet],
      :items => [:handcuffs, :medipack, :chemistry, :financial]

    }
  }
end

class Control
  @missions = Hash.new
  def new_mission(name,objective,pack)
    missions.store(name, ojective + pack)
    missions.store(status,:active)
  end

end

class Human
end