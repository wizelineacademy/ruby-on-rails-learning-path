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
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)
    if @pokemon.save
      flash[:notice] = "Pokemon created successfully."
      redirect_to(pokemons_path)
    else
      render('new')
    end
  end

  def edit
    @pokemon = Pokemon.find(params[:id])
  end

  def update
    @pokemon = Pokemon.find(params[:id])
    p @pokemon.name

    if @pokemon.update(pokemon_params)
      flash[:notice] = "Pokemon updated successfully."
      redirect_to(pokemon_path(@pokemon))
    else
      render('edit')
    end
  end

  def delete
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(:name, :height, :weight)
  end
end


