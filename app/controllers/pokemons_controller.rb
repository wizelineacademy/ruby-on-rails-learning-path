class PokemonsController < ApplicationController
	def index
		@pokemons = Pokemon.all
	end

  def new
    @pokemon = Pokemon.new
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)
    if @pokemon.save
      flash[:notice] = "Pokemon created successfully."
    else
      flash[:error] = @pokemon.errors
    end

    redirect_to pokemons_path
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end

  def edit
    @pokemon = Pokemon.find(params[:id])
  end

  def update
    @pokemon = Pokemon.find(params[:id])

    if @pokemon.update(pokemon_params)
      flash[:notice] = "Exito!"
    else
      flash[:error] = @pokemon.errors
    end

    redirect_to pokemons_path
  end

  def pokemon_api_show
    
  end

  def api_info
    api_connection = PokemonApiService.new('ditto')

    @response = api_connection.get_info

    render 'pokemon_api_show'
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(:name, :base_hp, :base_exp, :weight, :height)
  end
end
