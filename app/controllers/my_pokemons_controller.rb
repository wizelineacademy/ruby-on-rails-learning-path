class MyPokemonsController < ApplicationController
  before_action :set_my_pokemon, only: %i[ show edit update destroy ]
  before_action :authenticate_trainer!

  # GET /my_pokemons or /my_pokemons.json
  def index
    @my_pokemons = current_trainer.pokemons
  end

  # GET /my_pokemons/1 or /my_pokemons/1.json
  def show
    @my_pokemon = MyPokemon.where(["name = ?" , params[:id]])  

  end

  # GET /my_pokemons/new
  def new
    @my_pokemon = MyPokemon.new
  end

  # GET /my_pokemons/1/edit
  def edit
  end

  # POST /my_pokemons or /my_pokemons.json
  def create
    @my_pokemon = MyPokemon.new(allowed_params)

    respond_to do |format|
      if @my_pokemon.save
        format.html { redirect_to @my_pokemon, notice: "My pokemon was successfully created." }
        format.json { render :show, status: :created, location: @my_pokemon }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @my_pokemon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /my_pokemons/1 or /my_pokemons/1.json
  def update
    respond_to do |format|
      if @my_pokemon.update(allowed_params)
        format.html { redirect_to @my_pokemon, notice: "My pokemon was successfully updated." }
        format.json { render :show, status: :ok, location: @my_pokemon }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @my_pokemon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /my_pokemons/1 or /my_pokemons/1.json
  def destroy
    @my_pokemon.destroy
    respond_to do |format|
      format.html { redirect_to my_pokemons_url, notice: "My pokemon was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_my_pokemon
      @my_pokemon = MyPokemon.where(["name = ?" , params[:id]])  
    end

    # Only allow a list of trusted parameters through.
    def my_pokemon_params
      params.fetch(:my_pokemon, {})
    end

    def allowed_params
      params.require(:my_pokemon).permit(:abilities, :base_experience, :forms, :game_indices, :height, :held_items, :pokemon_api, :is_default, :location_area_encounters, :moves, :name, :order, :past_types, :species, :sprites, :stats, :types, :weight, :created_at, :updated_at)
  end 
end
