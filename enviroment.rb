module Environment
	class Depot
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

	class Control
    mission_statuses = %w(paused aborted failed accomplished)

    def new_mission(name, objective, pack)
      @missions = Hash[name, [objective, pack], 'status', :active]
    end

    mission_statuses.each do |mission_status|
      define_method("set_mission_to_#{mission_status}") do |mission_name|
        @missions[:mission_name][:status] = mission_status.to_sym
      end
    end
      
    end
	end

	class Human
    @id = object_id
    @name = "Name"
    @personal_data = Hash.new
    @professional_data = Hash.new

    data_types = %w(personal_data professional_data)

    data_types.each do |data_type|
      define_method("set_#{data_type}") do |params|
        instance_variable_set(data_type, params)
      end
    end
	end

  class Worker < Human
    @standard_shift = {
      id: object_id,
      hours: 8,
      payment: 8,
      facility: String.new,
      status: nil
    }

    @extra_shift = {
      id: object_id,
      hours: Integer.new,
      payment: Float.new,
      facility: String.new,
      status: nil
    }
  end
end
