module Environment
    class Depot
        #global access (getters & setters)
        attr_accessor :packs
        #new Hash
        def initialize
                @packs = {}
                simple_transportation_pack = {
                intelligence: [:cellphone],
                items: [:medipack, :chevy_versa]
          }
            standard_transportation_pack = {
                intelligence: [:cellphone, :antenna],
                arsenal: [:colt_1911],
                items: [:handcuffs,:medipack,:chemistry,:financial]
          }
            simple_mission_pack = {
                intelligence: [:infopack,:laptop,:cellphone, :antenna],
                arsenal: [:colt_1911],
                items: [:handcuffs,:medipack,:chemistry,:financial]
           }
            standard_mission_pack = {
                intelligence: [:infopack,:laptop,:cellphone, :antenna],
                arsenal: [:remmington_870,:colt_1911,:machete,:hatchet],
                items: [:handcuffs,:medipack,:chemistry,:financial]
           }
            @packs.store(:simple_transportation_pack, simple_transportation_pack)
            @packs.store(:standard_transportation_pack, standard_transportation_pack)
            @packs.store(:simple_mission_pack, simple_mission_pack)
            @packs.store(:standard_mission_pack, standard_mission_pack)
        end
    end

    class Control
        attr_accessor :missions
        def initialize
                @missions = {}
        end
        def new_mission(name: nil, objective: nil, pack: nil)
                @missions.store(name, {objective: objective, pack: pack, status: :active})
        end
                status_array = [:paused,:aborted,:failed,:accomplished]
                status_array.each do |status| 
            define_method("set_mission_to_#{status}") do |mission|
                @missions[mission][:status] = status
            end
        end
    end

    class Human
            attr_accessor :id, :name, :personal_data, :professional_data
            def initialize (name)
                @id = self.object_id 
                @name = name
            end
                data = [:personal, :professional]
                data.each do |type|
            define_method("set_#{type}_data") do |argument|
                case type
                    when :personal
                         @personal_data = {
                           surname: argument[:surname], age: argument[:age], 
                           country: argument[:country], language: argument[:language], 
                           marital_status: argument[:marital_status], children: argument[:children]
                         }
                    when :professional
                        @professional_data = {
                            position: argument[:position], occupation: argument[:occupation], 
                            skills: argument[:skills], observations: argument[:observations]
                       }
                end
            end
        end
    end

    class Worker < Human
        attr_accessor :standard_shift, :extra_shift
        def shift_type
            @standard_shift = {id: self.object_id, hours: 8, payment:8, facility: nil, status: nil}
            @extra_shift = {id: self.object_id, hours: nil, payment:nil, facility: nil, status: nil}
        end
    end
end