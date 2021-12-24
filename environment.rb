module Environment
    class Depot
        attr_accessor :packs

    def initialize
        
      @packs = {
        simple_transportation_pack: {
          intelligence: [:cellphone],
          items: [:medipack, :chevy_versa]
        },
        standard_transportation_pack: {
          intelligence: [:cellphone, :antenna],
          arsenal: [:colt_1911],
          items: [:handcuffs, :medipack, :chemistry, :chevy_versa]
        },
        simple_mission_pack: {
          intelligence: [:infopack, :laptop, :cellphone, :antenna],
          arsenal: [:colt_1911],
          items: [:handcuffs, :medipack, :chemistry, :financial]

        },
        standard_mission_pack: {
          intelligence: [:infopack, :laptop, :cellphone, :antenna],
          arsenal: [:remington_870, :colt_1911, :machete, :hatchet],
          items: [:handcuffs, :medipack, :chemistry, :financial]

        }
      }
    end

    def packs
      @packs
    end

    end

    class Control
        attr_accessor :missions

        def initialize
            @missions = Hash.new
        end
    
        def missions
            @missions
        end
    
        def new_mission(name, objective, pack)
            @missions[name] = {objective: objective, pack: pack, status: :active}
        end

        @states = [:paused, :aborted, :failed, :accomplished]

        @states.each do |status|
            define_method("set_mission_to_#{status}") do |mission|
                @missions[mission][:status] = status
            end
        end
    end

    class Human
        attr_accessor :id, :name, :personal_data, :professional_data

        def initialize(name)
            @id = self.object_id
            @name = name
            @personal_data = []
            @professional_data = []
        end

        @data = [:personal, :professional]

        @data.each do |name|
            define_method("set_#{name}_data") do |argument|
                instance_variable_set("@#{name}_data", argument)
            end
        end

        class Worker < Human
            attr_accessor :standard_shift, :extra_shift
            
            def initialize(name)
                @standard_shift = {
                    :id => object_id,
                    :hours => 8,
                    :payment => 8,
                    :facility => String.new,
                    :status => nil
                }
                @extra_shift = {
                    :id => object_id,
                    :hours => rand(1..8),
                    :payment => rand(1000..10000),
                    :facility => String.new,
                    :status => nil
                }
                super(:name => name)
            end
        end
    end
end 
