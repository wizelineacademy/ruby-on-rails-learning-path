#!/usr/bin/env ruby
require_relative 'environment'

class Game
    include Environment
    @board
    @depot
    @control
    @dictionary

    def initialize
        @board = {
            players: {},
            control: {},
            status: nil
        }
        @depot = Depot.new
        @control = Control.new
        @dictionary = Dictionary.new
    end

    def new_worker(worker)
        w = Human::Worker.new
        w.name = worker
        @board[:players][worker] = w
        w
    end

    def new_mission(name:, objective:, pack:)
        @control.new_mission(name: name, objective: objective, pack: pack)
        @board[:control][:missions] = @control.missions
    end

    class Dictionary
        @@expressions = {
            :hello => { :en => "hello", :es => "hola", :cz => "ahoj" },
            :goodbye => { :en => "goodbye", :es => "adios", :cz => "nashledanou" },
            :my_name_is => { :en => "my name is", :es => "mi nombre es", :cz => "jmenuju se" },
            :i_come_from => { :en => "i come from", :es => "yo vengo de", :cz => "ja odchazim od" }
        }
        
        @@expressions.each_key do |word|
            define_method("say_#{word}") do |lang|
                @@expressions[word][lang]
            end
        end
    
        attr_accessor :expressions
    end

    class Poker
        @deck
        @@number_words = {
            1 => "one",
            2 => "two",
            3 => "three",
            4 => "four",
            5 => "five",
            6 => "six",
            7 => "seven",
            8 => "eight",
            9 => "nine",
            10 => "ten"
        }
        @@odd_cards = {
            ace: "ace",
            jack: "jack",
            queen: "queen",
            king: "king"
        }
        @@figures = {
            spades: "spades",
            hearts: "hearts",
            diamonds: "diamonds",
            clubs: "clubs"
        }
        def initialize
            @deck = []
            @@odd_cards.each do |key, value|
                @@figures.each do |k, v|
                    @deck.append(:"#{value}_of_#{v}")
                end
            end
            (2..10).each do |num|
                @@figures.each do |k, v|
                    @deck.append(:"#{@@number_words[num]}_of_#{v}")
                end
            end
        end

        attr_accessor :deck
    end

    attr_accessor :board, :depot, :control
end


