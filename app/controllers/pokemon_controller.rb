class PokemonController < ApplicationController
  layout 'public'

  before_action :confirm_logged_in, :except => [:index, :show]
  before_action :set_stats, :only => [:show]
  before_action :get_types_and_abilities, :only => [:new, :edit]

  def index
    @pokemons = Pokemon.sorted
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end

  def new
    @pokemon = Pokemon.new
  end

  def edit
    @pokemon = Pokemon.find(params[:id])
  end

  def delete
    @pokemon = Pokemon.find(params[:id])
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)

    if !params[:pokemon][:types].empty?
      @pokemon.types = add_types(types: params[:pokemon][:types])
    end
    
    if !params[:pokemon][:abilities].empty?
      @pokemon.abilities = add_abilities(abilities: params[:pokemon][:abilities])
    end
    
    if @pokemon.save
      flash[:notice] = "Pokemon #{@pokemon[:name]} created succesfully."
      redirect_to(pokemons_path)
    else
      render('new')
    end
  end

  def update
    p params
    @pokemon = Pokemon.find(params[:id])

    if !params[:pokemon][:types].empty?
      @pokemon.types = add_types(types: params[:pokemon][:types])
    end
    
    if !params[:pokemon][:abilities].empty?
      @pokemon.abilities = add_abilities(abilities: params[:pokemon][:abilities])
    end
    
    if @pokemon.update(pokemon_params)
      flash[:notice] = "Pokemon #{@pokemon[:name]} updated succesfully."
      redirect_to(pokemons_path)
    else
      @pokemon = Pokemon.find(params[:id])
      render('edit')
    end
  end
  
  def destroy
    @pokemon = Pokemon.find(params[:id])
    @pokemon.destroy
    flash[:notice] = "#{@pokemon.name.capitalize} deleted succesfully."
    redirect_to(pokemons_path)
  end

  private
  def pokemon_params
    params.require(:pokemon).permit(:name, :height, :weight, :sprite, :hp, :attack, :defense, :special_attack, :special_defense, :speed)
  end

  def set_stats
    @pokemon_stats = %w(hp attack defense special_attack special_defense speed)
  end

  def get_types_and_abilities
    @all_types = Type.sorted
    @all_abilities = Ability.sorted
  end

  def add_types types:
    pokemon_types = []
    types.each do |type_id|
      pokemon_type = Type.find(type_id.to_i) if !type_id.empty?
      pokemon_types << pokemon_type if !pokemon_type.nil?
    end
    pokemon_types
  end

  def add_abilities abilities:
    pokemon_abilities = []
    abilities.each do |ability_id|
      pokemon_ability = Ability.find(ability_id.to_i) if !ability_id.empty?
      pokemon_abilities << pokemon_ability if !pokemon_ability.nil?
    end
    pokemon_abilities
  end
  
end
