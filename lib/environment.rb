module Environment

    class Depot
        @packs

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

        attr_accessor :packs
    end

    class Control
        @missions 
        @@statuses = {
            "paused" => :paused,
            "aborted" => :aborted,
            "failed" => :failed,
            "accomplished" => :accomplished
        } 

        def initialize
            @missions = {}
        end

        def new_mission(name:, objective:, pack:)
            @missions[name] = {
                objective: objective,
                pack: pack,
                status: :active
            }
        end

        ["paused", "aborted", "failed", "accomplished"].each do |method|
            define_method "set_mission_to_#{method}" do |mission|
                @missions[mission][:status] = @@statuses[method]
            end
        end

        attr_accessor :missions
    end

    class Human
        @id 
        @name 
        @personal_data 
        @professional_data

        def initialize(name: "")
            @name = name
            @id = object_id
        end

        ["professional_data", "personal_data"].each do |method|
            define_method "set_#{method}" do |**data|
                if method == "professional_data"
                    @professional_data = data
                else
                    @personal_data = data
                end
            end
        end

        class Worker < Human
            @standard_shift
            @extra_shift

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

            attr_accessor :standard_shift, :extra_shift
        end

        attr_accessor :id, :name, :personal_data, :professional_data
    end

end

