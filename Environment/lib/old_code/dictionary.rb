class Dictionary
	attr_accessor :expressions
	def initialize	
		@expressions = {
			:hello => { :es => 'hola', :cz => 'ahoj' },
			:goodbye => { :es => 'adios', :cz => 'nashledanou' },
			:my_name_is => { :es => 'ni nombre es', :cz => 'jmenuju se' },
			:i_come_from => { :es => 'yo vengo de', :cz => 'ja odchazim od' }
		}
	end
	
	expressions = [:hello, :goodbye, :my_name_is, :i_come_from]
	expressions.each do |expression|
		define_method("say_#{expression}") do |language|
			@expressions[expression][language]
		end
	end
end

dictionary = Dictionary.new
puts dictionary.say_hello :es 
puts dictionary.say_goodbye :cz
puts dictionary.respond_to? :say_my_name_is 