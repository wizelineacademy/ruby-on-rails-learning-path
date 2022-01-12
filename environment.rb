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
  
      ['paused', 'aborted', 'failed', 'accomplished'].each do |status|
        define_method("set_mission_to_#{status}") do |arg|
          @missions[arg][status] = status
        end
      end
    end
  
    class Human
      attr_accessor :id, :name, :personal_data, :professional_data
  
      def initialize(name:)
        @id = self.object_id
        @name = name
        @personal_data = {}
        @professional_data = {}
      end
  
      ['personal', 'professional'].each do |data|
        define_method("set_#{data}_data") do |arg|
          prop_name = "@#{data}_data".to_sym
          self.instance_variable_set(prop_name, arg)
        end
      end
    end
  
    class Worker < Human
      attr_accessor :standard_shift, :extra_shift
      def initialize(name:)
        super
        @standard_shift = {
          id: self.object_id,
          hours: 8,
          payment: 8,
          facility: nil,
          status: nil
        }
  
        @extra_shift = {
          id: self.object_id,
          hours: 0,
          payment: 0.0
        }
      end
    end
  end 