module Environment
  class Depot
    attr_accessor :packs
    
    def initialize
      @packs = {
        simple_transportation_pack: {
          intelligence: [:cellphone],
          items: [:mediapack, :chevy_versa]
        },
        standard_transportation_pack: {
          intelligence: [:cellphone],
          arsenal: [:colt_1911],
          items: [:mediapack, :chevy_versa]
        },
        simple_mission_pack: {
          intelligence: [:cellphone],
          arsenal: [:colt_1911],
          items: [:mediapack, :chevy_versa]
        },
        standard_mission_pack: {
          intelligence: [:infopack, :laptop, :cellphone, :antenna],
          arsenal: [:remington_870, :colt_1911, :machete, :hatchet],
          items: [:handcuffs, :medipack, :chemistry, :financial]
        }
      }
    end
  end

  class Control
    attr_accessor :missions


    def initialize
      @missions = {}
      @depot = Depot.new
    end

    def new_mission(name, objective, pack)
      @missions[name] = {
        status: :active,
        objective: objective,
        pack: @depot.packs[pack]
      }
    end
    
    %w(paused aborted failed accomplished).each do |status|
      define_method("set_mission_to_#{status}") { |name| @missions[name][:status] = status }
    end
  end
  

  class Human
    attr_accessor :id, :name, :personal_data, :professional_data

    def initialize(name)
      @id = object_id
      @name = name
      @personal_data = {}
      @professional_data = {}
    end


    %w(personal professional).each do |data_type|
      define_method("set_#{data_type}_data") do |data|
        instance_variable_set("@#{data_type}_data", data)
      end
    end
  end

  class Worker < Human
    attr_accessor :standard_shift, :extra_shift

    def initialize
      @standard_shift = {
        id: object_id,
        hours: 8,
        payment: 8,
        facility: nil,
        status: nil
      }
      @extra_shift = {
        id: object_id,
        hours: Integer.new,
        payment: Float.new,
        facility: nil,
        status: nil
      }
    end
  end
end