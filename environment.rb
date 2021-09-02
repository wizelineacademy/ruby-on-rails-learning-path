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
    end

    class Control

        attr_accessor :missions

        MISSION_STATUS = [:paused, :aborted, :failed, :accomplished]

        def initialize
            @missions = {}
        end

        def new_mission (name:, objective:, pack:)
            @missions.store(name, {
                objective: objective,
                status: :active,
                pack: pack
            })
        end

        MISSION_STATUS.each do |name|
            define_method("set_mission_to_#{name.to_s}") do |arg|
                @missions[arg][:status] = name
            end
        end
    end

    class Human

        attr_accessor :id, :name, :personal_data, :professional_data

        SET_METHODS = [:personal_data, :professional_data]

        def initialize (name:)
            @id = self.object_id
            @name = name
        end

        SET_METHODS.each do |attribute|
            define_method("set_#{attribute.to_s}") do |arg|
                case attribute
                when :personal_data
                    @personal_data = {
                        surname: arg[:surname],
                        age: arg[:age],
                        country: arg[:country],
                        language: arg[:language],
                        marital_status: arg[:marital_status]
                    }
                when :professional_data
                    @professional_data = {
                        position: arg[:position],
                        occupation: arg[:occupation],
                        skills: arg[:skills],
                        observations: arg[:observations]
                    }
                else
                    nil
                end
            end
        end
    end

    class Worker < Human

        attr_accessor :standard_shift, :extra_shift

        def initialize(name:)
            @standard_shift = {
                id: self.object_id,
                hours: 8,
                payment: 8,
                facility: "",
                status: :new,
            }
            @extra_shift = {
                id: self.object_id,
                hours: 8,
                payment: 8,
                facility: "",
                status: :new,
            }
            super(name)
        end
    end
end
