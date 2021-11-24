class PokemonController < ApplicationController
  layout 'public'

  def index
    @pokemons = Pokemon.all
  end

  def show
  end

  def new
  end

  def edit
  end

  def delete
  end

  def create
  end

  def update
  end
  
  def destroy
  end
end
