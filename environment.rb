module Environment

    class Depot
        attr_accessor :packs

        def initialize
            @packs = { 
                :simple_transportation_pack => { 
                    :intelligence => [:cellphone],
                    :items => [:medipack, :chevy_versa]
                },
                :standard_transportation_pack => { 
                    :intelligence => [:cellphone, :antenna],
                    :arsenal => [:colt_1911],
                    :items => [:handcuffs, :medipack, :chemistry, :chevy_versa]
                },
                :simple_mission_pack => { 
                    :intelligence => [:infopack, :laptop, :cellphone, :antenna],
                    :arsenal => [:colt_1911],
                    :items => [:handcuffs, :medipack, :chemistry, :finantial]
                },
                :standard_mission_pack => { 
                    :intelligence => [:infopack, :laptop, :cellphone, :antenna],
                    :arsenal => [:remington_870, :colt_1911, :machete, :hatchet],
                    :items => [:handcuffs, :medipack, :chemistry, :finantial]
                }
            }
        end
    end

    class Control
        attr_accessor :missions

        def initialize
            @missions = {}
        end

        def new_mission (name:, objective:, pack:)
            @missions[name] = {
                :objective => objective,
                :pack => pack,
                :status => :active
            }

            createStatusMethods(name)
        end

        private
        def createStatusMethods(mission_name)
            self.class.define_method("#{mission_name.to_s}_mission_paused") do
                @missions[mission_name][:status] = :paused
            end
            
            self.class.define_method("#{mission_name.to_s}_mission_aborted") do
                @missions[mission_name][:status] = :aborted
            end

            self.class.define_method("#{mission_name.to_s}_mission_failed") do
                @missions[mission_name][:status] = :failed
            end

            self.class.define_method("#{mission_name.to_s}_mission_accomplished") do
                @missions[mission_name][:status] = :accomplished
            end
        end
    end

    class Human
        attr_accessor :name, :personal_data, :professional_data
        attr_reader :id

        EXPECTED_PERRONAL_DATA_ARGUMENTS = %i(surname age country language marital_status children)
        EXPECTED_PROFESSIONAL_DATA_ARGUMENTS = %i(position ocupation skills observations)

        def initialize (name:)
            @id = self.object_id
            @name = name
        end

        def method_missing(method_name, *args, &block)
            if method_name.to_s =~ /set_(.*)_data/
                unless args.size == 1
                    raise ArgumentError, "Wrong number of arguments (given #{args.size}, expected 1)"
                end
                case $1
                    when 'personal'
                        #validate it contais all the required arguments
                        if(EXPECTED_PERRONAL_DATA_ARGUMENTS.all? {|s| args[0].key? s})
                            @personal_data = args[0]
                        else
                            raise ArgumentError, "Missing arguments (given #{args[0].keys.to_s}, expected: #{EXPECTED_PERRONAL_DATA_ARGUMENTS.to_s})"
                        end
                    when 'professional'
                         #validate it contais all the required arguments
                        if(EXPECTED_PROFESSIONAL_DATA_ARGUMENTS.all? {|s| args[0].key? s})
                            @professional_data = args[0]
                        else
                            raise ArgumentError, "Missing arguments (given #{args[0].keys.to_s}, expected: #{EXPECTED_PROFESSIONAL_DATA_ARGUMENTS.to_s})"
                        end
                    else
                        super
                end
            else
                super

            end
        end

        def respond_to_missing?(method_name, include_private = false)
            method_name.to_s =~ /set_(.*)_data/ || super
        end

        class Worker < Human
            attr_accessor :standard_shift, :extra_shift

            def init_shifts
                @standard_shift = {
                    :id => self.object_id,
                    :hours => 8,
                    :payment => 8,
                    :facility => String.new,
                    :status => nil
                }
                @extra_shift = {
                    :id => self.object_id,
                    :hours => Integer.new,
                    :payment => Float.new,
                    :facility => String.new,
                    :status => nil
                }
            end
        end
    end

end