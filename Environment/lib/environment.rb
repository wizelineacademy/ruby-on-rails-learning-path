module Environment
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
				intelligence: [:infopack, :laptop, :cellphone, :antenna],
				arsenal: [:remington_870, :colt_1911, :machete, :hatchet],
				items: [:handcuffs, :medipack, :chemistry, :financial]
			} and @packs.store(:standard_mission_pack, standard_mission_pack)
		end
	end
	#--------------------------------------------------------------------------------
	
	class Control 
		attr_accessor :missions
		def initialize
			@missions = Hash.new
		end
		
		def new_mission name: nil, objective: nil, pack: nil
			@missions.store(name, {objective: objective, status: :active, pack: pack})
		end
		
		statuses = [:paused, :aborted, :failed, :accomplished]
		statuses.each do |status|
			define_method("set_mission_to_#{status}") do |mission|
				@missions[mission][:status] = status
			end
		end
	end
	#--------------------------------------------------------------------------------
	
	class Human
		attr_accessor :id, :name, :personal_data, :professional_data
		def initialize name
			@id = self.object_id and @name = name
		end
		kind_of_data = [:personal, :professional]
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
	#--------------------------------------------------------------------------------
	
	class Dictionary # optional
		attr_accessor :expressions
		def initialize	
			@expressions = {
				:hello => { :en => 'hello', :es => 'hola', :cz => 'ahoj' },
				:goodbye => { :en => 'goodbye', :es => 'adios', :cz => 'nashledanou' },
				:my_name_is => { :en => 'my name is', :es => 'mi nombre es', :cz => 'jmenuju se' },
				:i_come_from => { :en => 'i come from', :es => 'yo vengo de', :cz => 'ja odchazim od' }
			}
		end
		expressions = [:hello, :goodbye, :my_name_is, :i_come_from]
		expressions.each do |expression|
			define_method("say_#{expression}") do |language|
				@expressions[expression][language]
			end
		end
	end
	#--------------------------------------------------------------------------------
	
	class Poker # optional
		attr_accessor :deck, :table
		def initialize
			sorts = [:swords, :clovers, :hearts, :diamonds] and @deck = Array.new
			cards = [:ace, :king, :queen, :jack, :nine, :eight, :seven, :six, :five, :four, :three, :two, :one]
			cards.each { |card| sorts.each { |sort| @deck.push("#{card}_of_#{sort}".to_sym) }}
			@deck.push(:black_joker) and  @deck.push(:red_joker)
			@deck.shuffle! and @table = Hash.new
		end
		
		def new_game players: nil
			puts "Welcome to a new Poker game"
			@deck.delete(:black_joker) and  @deck.delete(:red_joker) and hand = Array.new
			players.each { |player| hand, @deck = deal(deck: @deck, cards: 5); @table.store(player, hand) }
			@table.store(:deck, @deck)
		end
		
		def swap player: nil, table: nil
			puts table[player]
			puts "\nWhich cards would you like to swap?\nPlease separate them by spaces press [ENTER] if none."
			returned_cards = gets.chomp and returned_cards = returned_cards.split(' ').map(&:to_sym)
			unless returned_cards.nil?
				table[:deck].push(returned_cards) and table[:deck].flatten!
				returned_cards.each { |returned_card| table[player].delete(returned_card) }
				new_cards = table[:deck].shift(returned_cards.size)
				table[player].push(new_cards) and table[player].flatten!
			end
			puts "Your new hand #{player}.", table[player], "Thank you #{player.capitalize}!\n-----------\n\n\n"
			return table
		end
		
		def set_winner table: nil
		end
		
		private
		
			def deal deck: nil, cards: 1
				cards = deck.shift(cards) and return cards, deck
			end
	end
end



