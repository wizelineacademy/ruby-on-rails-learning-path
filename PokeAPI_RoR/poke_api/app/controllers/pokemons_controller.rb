class PokemonsController < ApplicationController
  before_action :confirm_logged_in, :find_user

  def index
    @pokemons = @user.pokemons.sorted
  end

  def show
    @pokemon = Pokemon.find params[:id]
  end

  def new
    @pokemon = Pokemon.new
    # Build each association after creating
    # the new pokemon object
    @pokemon.abilities.build
    @pokemon.moves.build
    @pokemon.types.build
  end

  def create
    # Instantiate a new object using form parameters
    @pokemon = Pokemon.new(pokemon_params)
    # Save the object
    if @pokemon.save
      # Add current instance to user's pokemons.
      @user.pokemons << @pokemon
      # If save succeeds, redirect to the pokemon's dashboard.
      flash[:notice] = "Pokemon #{@pokemon.name.capitalize} created successfully."
      redirect_to(pokemons_path)
    else
      # If save fails, redisplay the form so user can fix problems
      render(new_pokemon_path)
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
      flash[:notice] = 'Pokemon updated successfully.'
      redirect_to(pokemons_path)
    else
      # If save fails, redisplay the form so user can fix problems
      render(edit_pokemon_path)
    end
  end

  def delete
    @pokemon = Pokemon.find(params[:id])
  end

  def destroy
    @pokemon = Pokemon.find(params[:id])
    @pokemon.destroy
    flash[:notice] = "Pokemon '#{@pokemon.name.capitalize}' destroyed successfully."
    redirect_to(pokemons_path)
  end

  def set_pokemons
    create_pokemons
    flash[:notice] = '5 new Pokemons were added to your list.'
    redirect_to(pokemons_path)
  end

  private

  # Finds de current logged user.
  def find_user
    @user = User.find(@id)
  rescue StandardError
    flash[:error] = 'Could not find current user or session expired, please login.'
    redirect_to(access_login_path)
  end

  # Set pokemons from API and add them to the db.
  # TODO: not use PokeApi gem wrapper ?.
  def create_pokemons
    # Request API call to add 5 new pokemons.
    5.times do
      add_pokemon_to_db(pokemon: PokeApi.get(pokemon: rand(1..248)))
    end
  end

  # Adds the pokemon object information to the db.
  def add_pokemon_to_db(pokemon:)
    unless Pokemon.exists?(pokedex_id: pokemon.id)
      new_pokemon = Pokemon.new(name: pokemon.name, sprite_link: pokemon.sprites.front_default,
                                base_experience: pokemon.base_experience, height: pokemon.height,
                                weight: pokemon.weight, pokedex_id: pokemon.id)
      new_pokemon.abilities.new(pokemon_id: new_pokemon.id, name: pokemon.abilities.first.ability.name)
      new_pokemon.moves.new(pokemon_id: new_pokemon.id, name: pokemon.moves.first.move.name)
      new_pokemon.types.new(pokemon_id: new_pokemon.id, name: pokemon.types.first.type.name)
      new_pokemon.save
      @user.pokemons << new_pokemon
    end
  end

  def pokemon_params
    params.require(:pokemon).permit(:name, :base_experience, :height, :weight, :pokedex_id, :created_at, :updated_at,
                                    abilities_attributes: [:name], moves_attributes: [:name], types_attributes: [:name])
  end
end
