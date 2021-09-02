require_relative './environment.rb'

class Game
    include Environment

    attr_accessor :board, :depot, :control

    def initialize
        @board = {
            players: {},
            control: {},
            status: nil
        }
        @depot = Environment::Depot.new
        @control = Environment::Control.new
    end

    def new_worker(name:)
        @board[:players].store(name, Environment::Worker.new(name))
    end

    def new_mission(name:, objective:, pack:)
        @control.new_mission(name: name, objective: objective, pack: pack)
        @board[:control].store(:missions, @control.missions)
    end
end

class Dictionary
    attr_accessor :expressions

    def initialize
        @expressions = {
            hello: {en: "hello", es: "hola", cz: "ahoj"},
            goodbye: {en: "goodbye", es: "adios", cz: "nashledanou"},
            my_name_is: {en: "my name is", es: "mi nombre es", cz: "jmenuju se"},
            i_come_from: {en: "i come from", es: "yo vengo de", cz: "ja odchazim od"}
        }

        @expressions.each_key do |key|
            self.class.define_method("say_#{key.to_s}") do |arg|
                @expressions[key][arg]
            end
        end
    end
end

dic = Dictionary.new
p dic.say_hello(:es)
p dic.say_hello(:cz)
p dic.say_hello(:en)
p dic.say_goodbye(:es)
p dic.say_my_name_is(:cz)
p dic.say_i_come_from(:es)
game.new_mission(name: :alpha, objective: "Get alpha to the base", pack: game.depot.packs[:simple_transportation_pack])
puts game.control.missions[:alpha]
game.control.set_mission_to_accomplished(:alpha)
puts game.control.missions[:alpha]
