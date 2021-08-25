class Control 
	attr_accessor :missions
	def initialize
		@missions = Hash.new
	end
	
	def new_mission name: nil, objective: nil, resources: nil
		@missions.store(name, {objective: objective, status: :active, resources: resources})
	end
	
	statuses = [:paused, :aborted, :failed, :accomplished]
	statuses.each do |status|
		define_method("set_mission_to_#{status}") do |mission|
			@missions[mission][:status] = status
		end
	end
end

control = Control.new
control.new_mission name: :alpha, objective: 'Get Alpha to the base', resources: :standard_mission_pack
control.new_mission name: :beta, objective: 'Kill Beta', resources: :standard_mission_pack
puts control.missions
control.set_mission_to_accomplished(:alpha)
puts control.missions
puts control.respond_to?(:set_mission_to_paused)