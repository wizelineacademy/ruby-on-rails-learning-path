module Environment
  


class Depot
  attr_accessor :packs

  def initialize
    @packs = {
      simple_transportation_pack: {
        intelligence: [:cellphone],
        items: %i[medipack chevy_versa]
      },
      standard_transportation_pack: {
        intelligence: %i[cellphone antenna],
        arsenal: [:colt_1911],
        items: %i[handcuffs medipack chemistry chevy_versa]
      },
      simple_mission_pack: {
        intelligence: %i[infopack laptop cellphone antenna],
        arsenal: [:colt_1911],
        items: %i[handcuffs medipack chemistry financial]
  
      },
      standard_mission_pack: {
        intelligence: %i[infopack laptop cellphone antenna],
        arsenal: %i[remington_870 colt_1911 machete hatchet],
        items: %i[handcuffs medipack chemistry financial]
      }
    }
  end
  
end

class Control
  attr_accessor :missions
  #key = name
  #values :{objective,status,pack}
  states = %w(paused aborted failed accomplished)

  def initialize
    @missions = {

    }
  end

  #Not sure if this si the best way to recieve status, how to default status?
  def new_mission(name:,status:,**kwargs)
    #p "Name #{name}" #Remove but check what is name?
    @missions[name] = {
      status: status,
      objective: kwargs[:objective],
      pack: kwargs[:pack]
    }
  end

  states.each do |state|
    define_method("set_mission_to_#{state}") do |arg|
      @missions[arg][:status] = state
    end
  end

end

class Human
  attr_accessor :id, :name, :personal_data, :professional_data

  types = %w(personal professional)

  types.each do |type|
    define_method("set_#{type}_data") do |arg|
      @id = arg[:id]
      @name = arg[:name]
      if type == "personal" #/not sure hwo to do this dynamic
        @personal_data = {
          :surname => arg[:surname],
          :age => arg[:age],
          :country => arg[:country],
          :language => arg[:language],
          :marital_status => arg[:marital_status],
          :children => arg[:children]
        }
      elsif type == "professional"
        @professional_data = {
          :position => arg[:position],
          :occupation => arg[:occupation],
          :skills => arg[:skills],
          :observations => arg[:observations]
        }
      end
    end
  end
  
end

class Worker < Human
  attr_accessor :standard_shift, :extra_shift

  def initialize()
    @standard_shift = {
      :id => self.id,
      :hours => 8,
      :payment => 8,
      :facility => String.new,
      :status => nil
    }
    @extra_shift = {
      :id => self.id,
      :hours => 0,#Integer.new, ## is this not possible?
      :payment => 0.0,#Float.new
      :facility => "",
      :status => nil
    }
  end

end

end