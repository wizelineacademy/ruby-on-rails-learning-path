class Human
		attr_accessor :id, :name, :personal_data, :professional_data, :military_data
		
		def initialize name
			@id = self.object_id and @name = name
		end
		
		kind_of_data = [:personal, :professional, :military]
		kind_of_data.each do |kind|
			define_method("set_#{kind}_data") do |arguments|
				case kind
				when :personal
					@personal_data = {
						surname: arguments[:surname], age: arguments[:age], 
						country: arguments[:country], language: arguments[:language],
						marital_status: arguments[:marital_status], children: arguments[:children],
					}
				when :professional
					@professional_data = {
						position: arguments[:position], occupation: arguments[:occupation], skills: arguments[:skills], 
						observations: arguments[:observations],
					}
				when :military
					@military_data = {
						first_skill: arguments[:first_skill], second_skill: arguments[:second_skill], 
						damage: arguments[:damage], life: arguments[:life]
					}
				end
			end
		end
end

class Worker < Human
	attr_accessor :standard_shift, :extra_shift
	def set_shift
		@standard_shift = { id: self.object_id, hours: 8, payment: 8, facility: nil, status: nil }
		@extra_shift = { id: self.object_id, hours: nil, payment: nil, facility: nil, status: nil }
	end
end

class Warrior < Human
	attr_accessor :missions
	def set_mission mission: nil
		@missions = { id: self.object_id, mission: mission }
	end
end