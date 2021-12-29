module Enviroment
  class Depot
    attr_accessor :packs
    def initialize
      
      @packs = { 
        :simple_transportation_pack => {
          :intelligence => [:cellphone],
          :items => [:medipack, :chevy_versa], 
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
    
  end

  class Control
    attr_accessor :missions 
    def new_mission(name: nil ,objective: nil, pack: nil)
      @missions = Hash.new 
      @missions.store(name, {objective: objective, status: :active, pack: pack})
    end
    ["paused","aborted","failed","accomplished"].each {|method|
        define_method "set_mission_#{method}(:name)" do
          @missionn[name][:status] = method
        end
    }

  end

  class Human
    attr_accessor :id, :name,:personal_data, :professional_data
    def initialize name
      @id = self.object_id and @name = name
    end
    type_of_data = [:personal,:professional]
    type_of_data.each {|type|
      define_method("set_#{type}_data") do |arguments|
        case type
          when :personal
            @personal_data = {
              surname: arguments[:surname], age: arguments[:age], 
              country: arguments[:country], language: arguments[:language],
              marital_status: arguments[:marital_status], children: arguments[:children],
            }
          when :professional
            @professional_data = {
              position: arguments[:position], occupation: arguments[:occupation], skills: arguments[:skills], 
              observations: arguments[:observations],
            }
          end
        end
    }
    
  end

  class Worker<Human
    attr_accessor :standart_shift, :extra_shift

    def initialize()
      @standart_shift= {:id => self.object_id,
        :hours => 8,
        :payment => 8,
        :facility => String.new,
        :status => nil 
        }
      @extra_shift={
        :id => self.object_id,
        :hours => 0,
        :payment => 0.0,
        :facility => String.new,
        :status => nil 
      }  
    end
  end
end
