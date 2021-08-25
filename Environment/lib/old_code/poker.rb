#!/bin/ruby

class Poker
	attr_accessor :deck, :table
	def initialize
		sorts = [:swords, :clovers, :hearts, :diamonds] and @deck = Array.new
		cards = [:ace, :king, :queen, :jack, :nine, :eight, :seven, :six, :five, :four, :three, :two, :one]
		cards.each { |card| sorts.each { |sort| @deck.push("#{card}_of_#{sort}".to_sym) }}
		@deck.push(:black_joker) and  @deck.push(:red_joker)
		@deck.shuffle! and @table = Hash.new
	end
	
	def new_game players: nil
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

poker = Poker.new and players = ['Diego', 'Juan']
poker.new_game players: players

players.each do |player|
	puts player
	poker.table = poker.swap player: player, table: poker.table
end

puts :deck, poker.table[:deck]