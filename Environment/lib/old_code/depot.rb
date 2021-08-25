class Depot
	attr_accessor :packs
	def initialize
		@packs = Hash.new
		simple_transportation_pack = {
			intelligence: [:cellphone],
			items: [:medipack, :chevy_versa]
		} and @packs.store(:simple_transportation_pack, simple_transportation_pack)
		standard_transportation_pack = {
			intelligence: [:cellphone, :antenna],
			arsenal: [:colt_1911],
			items: [:handcuffs, :medipack, :chemistry, :chevy_versa]
		} and @packs.store(:standard_transportation_pack, standard_transportation_pack)
		simple_mission_pack = {
			intelligence: [:infopack, :laptop, :cellphone, :antenna],
			arsenal: [:colt_1911],
			items: [:handcuffs, :medipack, :chemistry, :financial]
		} and @packs.store(:simple_mission_pack, simple_mission_pack)
		standard_mission_pack = {
			intelligence: [:infopac-k, :laptop, :cellphone, :antenna],
			arsenal: [:remington_870, :colt_1911, :machete, :hatchet],
			items: [:handcuffs, :medipack, :chemistry, :financial]
			} and @packs.store(:standard_mission_pack, standard_mission_pack)
	end
	
	kinds = [:standard, :simple] and packs = [:transportation, :mission]
	kinds.each do |kind|
		packs.each do |pack|
			define_method("get_#{kind}_#{pack}_pack") do
				return @packs[:simple_transportation_pack] if kind == :simple and pack == :transportation
				return @packs[:standard_transportation_pack] if kind == :standard and pack == :transportation
				return @packs[:simple_mission_pack] if kind == :simple and pack == :mission
				return @packs[:standard_mission_pack] if kind == :standard and pack == :mission
			end	
		end
	end
end

depot = Depot.new
puts depot.packs[:simple_mission_pack]
puts depot.get_simple_transportation_pack
puts depot.respond_to?(:get_simple_mission_pack)