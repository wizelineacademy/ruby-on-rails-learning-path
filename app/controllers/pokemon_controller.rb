class PokemonController < ApplicationController
  layout 'public'

  before_action :set_stats, :only => [:show]

  def index
    @pokemons = Pokemon.all
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end

  def new
    @pokemon = Pokemon.new
    @types = Type.sorted
    @abilities = Ability.sorted
  end

  def edit
    @pokemon = Pokemon.find(params[:id])
    @all_types = Type.sorted
    @all_abilities = Ability.sorted
  end

  def delete
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)
    p params
  end

  def update
    p params
  end
  
  def destroy
  end

  private
  def pokemon_params
    params.require(:pokemon).permit(:name, :hp, :attack, :defense, :special_attack, :special_defense, :speed)
  end

  def set_stats
    @pokemon_stats = %w(hp attack defense special_attack special_defense speed)
  end
  
end
