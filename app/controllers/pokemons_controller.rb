class PokemonsController < ApplicationController
  before_action :confirm_logged_in

  def index
    @pokemons = Pokemon.sorted
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end

  def new
    @pokemon = Pokemon.new
    @abilities = Ability.all
    @stats = Stat.all
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)
    params[:pokemon][:abilities].each do |ability|
      @pokemon.abilities << Ability.find(ability)
    end
    params[:pokemon][:stats].each do |stat|
      @pokemon.stats << Stat.find(stat)
    end
    if @pokemon.save
      flash[:notice] = "Pokemon created successfully."
      redirect_to(pokemons_path)
    else
      render('new')
    end
  end

  def edit
    @pokemon = Pokemon.find(params[:id])
    @abilities = Ability.all
    @stats = Stat.all

    @abilities_ids = [];
    @pokemon.abilities.each do |ability|
      @abilities_ids.push(ability.id)
    end

    @stats_ids = [];
    @pokemon.stats.each do |stat|
      @stats_ids.push(stat.id)
    end
  end

  def update
    @pokemon = Pokemon.find(params[:id])
    @abilities_ids = [];
    @pokemon.abilities.each do |ability|
      @abilities_ids.push(ability.id)
    end

    @stats_ids = [];
    @pokemon.stats.each do |stat|
      @stats_ids.push(stat.id)
    end

    # Add new Pokemon Ability
    params[:pokemon][:abilities].each do |ability|
      if !@abilities_ids.include? ability
        @pokemon.abilities << Ability.find(ability)
      end
    end

    # Add new Pokemon Stat
    params[:pokemon][:stats].each do |stat|
      if !@stats_ids.include? stat
        @pokemon.stats << Stat.find(stat)
      end
    end

    # Delete Pokemon Ability
    @abilities_ids.each do |ability|
      if !params[:pokemon][:abilities].include? ability
        pokemon_ability = PokemonAbility.where(
          :pokemon_id => @pokemon.id, 
          :ability_id => ability
        ).first
        if pokemon_ability
          pokemon_ability.destroy
        end
      end
    end

    # Delete Pokemon Stat
    @stats_ids.each do |stat|
      if !params[:pokemon][:stats].include? stat
        pokemon_stat = PokemonStat.where(
          :pokemon_id => @pokemon.id, 
          :stat_id => stat
        ).first
        if pokemon_stat
          pokemon_stat.destroy
        end
      end
    end

    if @pokemon.update(pokemon_params)
      flash[:notice] = "Pokemon updated successfully."
      redirect_to(pokemon_path(@pokemon))
    else
      render('edit')
    end
  end

  def delete
    @pokemon = Pokemon.find(params[:id])
  end

  def destroy
    @pokemon = Pokemon.find(params[:id])
    @pokemon.destroy
    flash[:notice] = "Pokemon destroyed successfully."
    redirect_to(pokemons_path)
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(:name, :height, :weight, :abilities, :stats)
  end
end
