module Environment
    class Depot
        attr_accessor :packs

        def initialize   
            @packs = { 
                :simple_transportation_pack => {
                    :intelligence => [:cellphone],
                    :items => [:mediapack, :chevy_versa]
                },
                :standard_transportation_pack => {
                    :intelligence => [:cellphone, :antenna],
                    :arsenal => [:colt_1911],
                    :items => [:handcuffs, :medipack, :chemistry, :chevy_versa]
                },
                :simple_mission_pack => {
                    :intelligence => [:infopack, :laptop, :cellphone, :antenna],
                    :arsenal=> [:colt_1911],
                    :items => [:handcuffs, :medipack, :chemistry, :financial]
                },
                :standard_mission_pack => {
                    :intelligence => [:infopack, :laptop, :cellphone, :antenna],
                    :arsenal => [:remington_870, :colt_1911, :machete, :hatchet],
                    :items => [:handcuffs, :medipack, :chemistry, :financial]
                }
            }
        end
    end

    class Control
        attr_accessor :missions
        
        def initialize
            @missions = {}
        end

        def new_mission(name, objective, pack)
            @missions[name] = {
                :objective => objective,
                :pack => pack,
                :status => :active
            }
        end

        @status = ["paused", "aborted", "failed", "accomplished"]
        @status.each do |state|
            define_method("set_mission_to_#{state}") do |name|
                @missions[name][:status] = state.to_sym
            end
        end

    end

    class Human
        attr_accessor :id, :name, :personal_data, :professional_data

        def initialize(name)
            @id = object_id,
            @name = name,
            @personal_data = Hash.new,
            @professional_data = Hash.new
        end

        @data = ["personal", "professional"]
        @data.each do |type|
        
            define_method("set_#{type}_data") do |args|
                instance_variable_set("@#{type}", args)
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
                status:  nil
            },
            @extra_shift = {
                id: object_id,
                hours: 0,
                payment: 0.0,
                facility: nil,
                status: nil
            }
        end
    end
end