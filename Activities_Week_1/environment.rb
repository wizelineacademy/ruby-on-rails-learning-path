module Environment
  class Depot
    attr_accessor :packs

    def initialize
      @packs = {
        'simple_transportation_pack': { 'intelligence': %w[cellphone], 'items': %w[medipack chevy_versa] },
        'standard_transportation_pack': { 'intelligence': %w[cellphone antenna], 'arsenal': %w[colt_1911],
                                          'items': %w[handcuffs medipack chemistry chevy_versa] },
        'simple_mission_pack': { 'intelligence': %w[infopack laptop cellphone antenna], 'arsenal': %w[colt_1911],
                                 'items': %w[handcuffs medipack chemistry financial] },
        'standard_mission_pack': { 'intelligence': %w[infopack laptop cellphone antenna],
                                   'arsenal': %w[remington_870 colt_1911 machete hatchet],
                                   'items': %w[handcuffs medipack chemistry financial] }
      }
    end
  end

  class Control
    attr_accessor :missions

    mission_states = %w[paused aborted failed accomplished]

    def initialize
      @missions = {}
    end

    mission_states.each do |state|
      define_method("set_mission_to_#{state}") do |name|
        if @missions.key?(name)
          @missions[name][:status] = state
        else
          puts "Unable to find mission: #{name}. Please, check mission name and try again."
        end
      end
    end

    def new_mission(name, objective, pack)
      @missions = { name => { 'objective': objective, 'status': 'active', 'pack': pack } }
    end
  end

  class Human
    attr_accessor :id, :name, :personal_data, :professional_data

    data_types = %w[personal professional]

    def initialize(name)
      @id = object_id
      @name = name
      @personal_data = {}
      @professional_data = {}
    end

    data_types.each do |type|
      define_method("set_#{type}_data") do |**args|
        if type.eql? 'personal'
          @personal_data = args
        else
          @professional_data = args
        end
      end
    end
  end

  class Worker < Human
    attr_accessor :standard_shift, :extra_shift

    def initialize(name)
      super(name)
      @standard_shift = { 'id': object_id, 'hours': 8, 'payment': 8, 'facility': String.new, 'status': nil }
      @extra_shift = { 'id': object_id, 'hours': 0, 'payment': 0.0, 'facility': String.new, 'status': nil }
    end
  end
end
