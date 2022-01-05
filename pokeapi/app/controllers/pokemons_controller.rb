class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.sorted
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end

  def new
    @pokemon = Pokemon.new({:name => 'Pokemon name', :weight => 'Pokemon weigth', :height => 'Pokemon height' })
  end

  def create
      # Instantiate a new object using form parameters
      @pokemon = Pokemon.new(pokemon_params)
      # Save the object
      if @pokemon.save
        # If save succeeds, redirect to the index action
        redirect_to(pokemons_path)
      else
        # If save fails, redisplay the form so user can fix problems
        render('new')
      end
  end

  def edit
    @pokemon = Pokemon.find(params[:id])
  end

  def update
    # Find a new object using form parameters
    @pokemon = Pokemon.find(params[:id])
    # Update the object
    if @pokemon.update(pokemon_params)
      # If save succeeds, redirect to the show action
      redirect_to(pokemon_path(@pokemon))
    else
      # If save fails, redisplay the form so user can fix problems
      render('edit')
    end
  end

  def delete
    @pokemon = Pokemon.find(params[:id])
  end

  def destroy
    @pokemon = Pokemon.find(params[:id])
    @pokemon.destroy
    redirect_to(pokemons_path)
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(:pokemon_id,:name, :weight, :height, :base_experience)
  end
end
