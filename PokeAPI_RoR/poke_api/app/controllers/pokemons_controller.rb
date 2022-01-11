class PokemonsController < ApplicationController
  before_action :confirm_logged_in, :find_user

  def index
    @pokemons = @user.pokemons.sorted
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end

  def new
    @pokemon = Pokemon.new
  end

  def create
    # Instantiate a new object using form parameters
    @pokemon = Pokemon.new(pokemon_params)
    # Save the object
    if @pokemon.save
      # If save succeeds, redirect to the index action
      flash[:notice] = 'Pokemon created successfully.'
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
    if @pokemon.update_attributes(pokemon_params)
      # If save succeeds, redirect to the show action
      flash[:notice] = 'Pokemon updated successfully.'
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
    flash[:notice] = "Pokemon '#{@pokemon.name}' destroyed successfully."
    redirect_to(pokemons_path)
  end

  def set_pokemons
    create_pokemons
    redirect_to(pokemons_path)
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  rescue StandardError
    redirect_to(pokemons_path(user_id: @id))
  end

  # Set pokemons from API and add them to the db.
  # TODO: not use PokeApi gem wrapper.
  def create_pokemons
    # Request API call only if there's not enough records in db.
    if Pokemon.all.count < 20
      20.times do
        add_pokemon_to_db(pokemon: PokeApi.get(pokemon: rand(1..248)))
      end
    end
  end

  # Adds the pokemon object information to the db.
  def add_pokemon_to_db(pokemon:)
    unless Pokemon.exists?(pokedex_id: pokemon.id)
      new_pokemon = Pokemon.create(name: pokemon.name, sprite_link: pokemon.sprites.front_default,
                                   base_experience: pokemon.base_experience, height: pokemon.height,
                                   weight: pokemon.weight, pokedex_id: pokemon.id)
      new_pokemon.abilities.create(pokemon_id: new_pokemon.id, name: pokemon.abilities.first.ability.name)
      new_pokemon.moves.create(pokemon_id: new_pokemon.id, name: pokemon.moves.first.move.name)
      new_pokemon.types.create(pokemon_id: new_pokemon.id, name: pokemon.types.first.type.name)
      user = User.where(username: @username).or(User.where(email: @username)).first
      user.pokemons << new_pokemon if user
    end
  end

  def pokemon_params
    params.require(:pokemon).permit(:name, :base_experience, :height, :weight, :pokedex_id, :created_at, :updated_at)
  end
end
